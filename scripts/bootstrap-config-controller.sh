#!/bin/bash
# scripts/bootstrap_config_controller.sh
#
# This script bootstraps a GCP Config Controller instance and configures Config Sync
# to pull infrastructure definitions from a Git repository, to be managed by Config Connector.
#
# Usage:
#   ./scripts/bootstrap_config_controller.sh \
#       --project-id <YOUR_GCP_PROJECT_ID> \
#       --region <GCP_REGION> \
#       --host-project-id <SHARED_VPC_HOST_PROJECT_ID> \
#       --repo-url <GIT_REPO_URL> \
#       --repo-branch <GIT_REPO_BRANCH> \
#       --gcp-billing-account-id <GCP_BILLING_ACCOUNT_ID>

set -euo pipefail

# --- Configuration Variables (defaults, can be overridden by arguments) ---
GCP_PROJECT_ID=""
GCP_REGION="us-central1"
GCP_ZONE="us-central1-a" # Default zone for gcloud config
GCP_HOST_PROJECT_ID="" # For Shared VPC, can be same as GCP_PROJECT_ID
CONFIG_CONTROLLER_NAME="openlane-config-controller"
GIT_REPO_URL=""
GIT_REPO_BRANCH="main"
GCP_BILLING_ACCOUNT_ID="" # Needed for gcp-project chart if creating new projects

# --- Helper Functions ---

log_info() {
  echo "INFO: $*"
}

log_error() {
  echo "ERROR: $*" >&2
  exit 1
}

validate_gcloud_auth() {
  log_info "Validating gcloud authentication..."
  if ! gcloud auth list --format="value(status)" | grep -q "ACTIVE"; then
    log_error "gcloud is not authenticated. Please run 'gcloud auth login' and try again."
  fi
  if ! gcloud config get-value account > /dev/null; then
    log_error "gcloud account not set. Please run 'gcloud auth login' or 'gcloud config set account <your-email>'."
  fi
  log_info "gcloud authenticated successfully."
}

# Function to enable required GCP APIs
enable_gcp_apis() {
  local project_id="$1"
  log_info "Enabling required APIs in project: ${project_id}..."
  local apis=(
    "container.googleapis.com"
    "config-controller.googleapis.com"
    "serviceusage.googleapis.com"
    "cloudresourcemanager.googleapis.com"
    "compute.googleapis.com"
    "sqladmin.googleapis.com"
    "dns.googleapis.com"
    "redis.googleapis.com"
    "iam.googleapis.com"
    "billingbudgets.googleapis.com"
    "cloudkms.googleapis.com" # For GKE CMEK for example
  )
  for api in "${apis[@]}"; do
    if ! gcloud services enable "$api" --project="$project_id"; then
      log_error "Failed to enable API: $api in project $project_id"
    fi
  done
  log_info "All required APIs enabled."
}

# Function to grant IAM permissions to Config Controller Service Account
# Config Connector uses Workload Identity internally. The Config Controller's managed KSA
# is bound to a specific GCP SA. This script grants permissions to that GCP SA.
grant_config_controller_iam() {
  local project_id="$1" # Project where Config Controller runs
  local host_project_id="$2" # Host project for Shared VPC

  log_info "Fetching Config Controller's managed Workload Identity Service Account ID..."
  # The Config Controller creates a service account in the project where it runs.
  # Its format is service-<PROJECT_NUMBER>@gcp-sa-config-controller.iam.gserviceaccount.com
  local config_controller_project_number=$(gcloud projects describe "$project_id" --format="value(projectNumber)")
  if [ -z "$config_controller_project_number" ]; then
    log_error "Could not get project number for Config Controller project ${project_id}"
  fi
  local config_connector_sa="serviceAccount:service-${config_controller_project_number}@gcp-sa-config-controller.iam.gserviceaccount.com"

  log_info "Granting IAM roles to Config Connector Workload Identity SA ( ${config_connector_sa} )..."
  # These roles allow Config Connector to manage resources. 'roles/owner' is broad.
  # In production, use specific roles:
  # - roles/container.admin for GKE clusters
  # - roles/compute.networkAdmin for VPC, Subnets, Firewall, Shared VPC
  # - roles/cloudsql.admin for CloudSQL
  # - roles/memorystore.admin for Redis
  # - roles/dns.admin for DNS
  # - roles/resourcemanager.projectCreator for creating new projects
  # - roles/iam.serviceAccountAdmin for managing service accounts
  # - roles/serviceusage.serviceUsageAdmin for enabling APIs
  local iam_roles_common=(
    "roles/owner" # Highly permissive, use for initial setup/demo
    "roles/resourcemanager.projectCreator" # To allow creating other projects
    "roles/resourcemanager.projectIamAdmin" # To allow managing IAM on other projects
  )

  log_info "Granting common roles to Config Controller SA in project: ${project_id}..."
  for role in "${iam_roles_common[@]}"; do
    if ! gcloud projects add-iam-policy-binding "$project_id" \
      --member="$config_connector_sa" --role="$role"; then
      log_error "Failed to bind common role ${role} to ${config_connector_sa} in project ${project_id}"
    fi
  done

  # Grant roles in the Config Controller's project itself (if resources managed here)
  # For CNRM, the Config Controller's SA needs permissions on the project where it operates.
  # If it's creating everything in <project_id>, then these roles are needed here.
  # The `roles/owner` from `iam_roles_common` usually covers this.

  # If Shared VPC is used, grant roles in the Host Project as well.
  if [ "$host_project_id" != "$project_id" ]; then
    log_info "Granting IAM roles to Config Connector SA in Host Project: ${host_project_id}..."
    local host_iam_roles=(
      "roles/owner" # Broad, restrict severely in production.
      "roles/compute.networkAdmin" # Essential for Shared VPC
      "roles/container.admin" # For GKE in service projects
      "roles/resourcemanager.lienModifier" # If cluster uses Shared VPC liens
    )
    for role in "${host_iam_roles[@]}"; do
      if ! gcloud projects add-iam-policy-binding "$host_project_id" \
        --member="$config_connector_sa" --role="$role"; then
        log_error "Failed to bind host role ${role} to ${config_connector_sa} in host project ${host_project_id}"
      fi
    done
    log_info "IAM roles granted in Host Project: ${host_project_id}"
  fi
}


# --- Argument Parsing ---
while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-id)
      GCP_PROJECT_ID="$2"
      shift 2
      ;;
    --region)
      GCP_REGION="$2"
      shift 2
      ;;
    --host-project-id)
      GCP_HOST_PROJECT_ID="$2"
      shift 2
      ;;
    --repo-url)
      GIT_REPO_URL="$2"
      shift 2
      ;;
    --repo-branch)
      GIT_REPO_BRANCH="$2"
      shift 2
      ;;
    --gcp-billing-account-id)
      GCP_BILLING_ACCOUNT_ID="$2"
      shift 2
      ;;
    *)
      log_error "Unknown option: $1"
      ;;
  esac
done

# --- Input Validation ---
if [ -z "$GCP_PROJECT_ID" ]; then
  log_error "--project-id is required."
fi
if [ -z "$GIT_REPO_URL" ]; then
  log_error "--repo-url is required (e.g., https://github.com/your-org/this-repo.git)."
fi
if [ -z "$GCP_HOST_PROJECT_ID" ]; then
  # If no explicit host project is provided, assume config controller project is also the host project.
  GCP_HOST_PROJECT_ID="$GCP_PROJECT_ID"
  log_info "No --host-project-id provided. Assuming ${GCP_PROJECT_ID} is also the Shared VPC Host Project."
fi
if [ -z "$GCP_BILLING_ACCOUNT_ID" ]; then
  log_info "No --gcp-billing-account-id provided. Chart 'gcp-project' will fail if used to create new projects. Ensure you manually provide it or update config."
fi

# --- Main Logic ---

log_info "Starting GCP Config Controller bootstrap process..."
log_info "GCP Project ID           : ${GCP_PROJECT_ID}"
log_info "GCP Region               : ${GCP_REGION}"
log_info "GCP Host Project ID      : ${GCP_HOST_PROJECT_ID}"
log_info "Config Controller Name   : ${CONFIG_CONTROLLER_NAME}"
log_info "Git Repo URL             : ${GIT_REPO_URL}"
log_info "Git Repo Branch          : ${GIT_REPO_BRANCH}"
log_info "GCP Billing Account ID   : $( [ -n "$GCP_BILLING_ACCOUNT_ID" ] && echo "$GCP_BILLING_ACCOUNT_ID" || echo "N/A" )"

validate_gcloud_auth
gcloud config set project "$GCP_PROJECT_ID"

# Enable required APIs in the Config Controller project
enable_gcp_apis "$GCP_PROJECT_ID"

# Create the Config Controller instance
log_info "Creating Config Controller instance '${CONFIG_CONTROLLER_NAME}' in region '${GCP_REGION}'..."
if gcloud config-controller describe "$CONFIG_CONTROLLER_NAME" --location "$GCP_REGION" --project "$GCP_PROJECT_ID" &>/dev/null; then
  log_info "Config Controller instance '${CONFIG_CONTROLLER_NAME}' already exists. Skipping creation."
else
  # Ensure a network exists for the Config Controller's private endpoint.
  # In a production setup, you'd likely have this pre-provisioned or use the 'gcp-vpc'
  # chart deployed to the host project beforehand. For a quick start, we can create one if not exists.
  local temp_network_name="openlane-temp-config-network"
  local temp_subnet_name="openlane-temp-config-subnet"

  if ! gcloud compute networks describe "$temp_network_name" --project="$GCP_HOST_PROJECT_ID" --format="value(name)" &>/dev/null; then
      log_info "Creating temporary network '${temp_network_name}' in ${GCP_HOST_PROJECT_ID} for Config Controller."
      gcloud compute networks create "$temp_network_name" --project="$GCP_HOST_PROJECT_ID" --subnet-mode=custom --mtu=1460
      log_info "Creating temporary subnetwork '${temp_subnet_name}' in ${GCP_HOST_PROJECT_ID}..."
      gcloud compute networks subnets create "$temp_subnet_name" \
          --network="$temp_network_name" \
          --range="10.200.0.0/20" \
          --region="$GCP_REGION" \
          --project="$GCP_HOST_PROJECT_ID" \
          --enable-private-ip-google-access
  else
      log_info "Temporary network '${temp_network_name}' already exists."
  fi

  gcloud config-controller create "$CONFIG_CONTROLLER_NAME" \
    --location "$GCP_REGION" \
    --project "$GCP_PROJECT_ID" \
    --network "$temp_network_name" \
    --master-ipv4-cidr-block "10.10.0.0/28" \
    --resource-locations "$GCP_REGION" \
    --channel "regular" \
    --full-management \
    --enable-dns-access \
    --async # Run in background to continue with IAM setup
  log_info "Config Controller creation initiated. This may take 15-20 minutes."
fi

# Wait for Config Controller to be RUNNING
log_info "Waiting for Config Controller '${CONFIG_CONTROLLER_NAME}' to reach 'RUNNING' state..."
gcloud config-controller wait "$CONFIG_CONTROLLER_NAME" --location "$GCP_REGION" --project "$GCP_PROJECT_ID" --for="state=RUNNING" --timeout=3600s
log_info "Config Controller '${CONFIG_CONTROLLER_NAME}' is now RUNNING."

# Grant necessary IAM permissions to Config Controller's SA (used by Config Connector)
grant_config_controller_iam "$GCP_PROJECT_ID" "$GCP_HOST_PROJECT_ID"

# Get kubectl credentials for the Config Controller cluster
log_info "Getting kubectl credentials for Config Controller cluster..."
gcloud config-controller get-credentials "$CONFIG_CONTROLLER_NAME" \
  --location "$GCP_REGION" \
  --project "$GCP_PROJECT_ID"

log_info "Verifying Config Connector installation by checking for CNRM CRDs..."
if ! kubectl get crd configcontrollers.config.cnrm.cloud.google.com &>/dev/null; then
    log_error "Config Connector CRDs not found in Config Controller cluster. Something might be wrong with the Config Controller setup."
fi
log_info "Config Connector is installed and ready."


# Configure Config Sync to pull from the Git repository
log_info "Configuring Config Sync to pull from Git repository '${GIT_REPO_URL}' (branch: ${GIT_REPO_BRANCH})..."

# Deriving unique sync name from the repo URL
REPO_SYNC_NAME=$(echo "$GIT_REPO_URL" | sed -e 's/.*\///' -e 's/\.git$//' | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]/-/g' | sed 's/^-*//;s/-*$//')

# You can also use a specific namespace for Config Sync to apply resources to
# For CNRM, it's often recommended to use the default namespace for project-scoped resources
# or a separate namespace where Config Connector is configured to manage resources.
# By default, Config Controller configures Config Connector in the 'cnrm-system' namespace.
# We will use the default sync parameters, which typically apply to project-scoped resources.
if gcloud config-sync repos list --cluster="$CONFIG_CONTROLLER_NAME" --location="$GCP_REGION" --project="$GCP_PROJECT_ID" --format="value(name)" | grep -q "$REPO_SYNC_NAME"; then
  log_info "Config Sync repository for ${REPO_SYNC_NAME} (from ${GIT_REPO_URL}) already exists. Skipping creation."
else
  gcloud config-sync repos add "$REPO_SYNC_NAME" \
    --cluster="$CONFIG_CONTROLLER_NAME" \
    --location="$GCP_REGION" \
    --project="$GCP_PROJECT_ID" \
    --git-url="$GIT_REPO_URL" \
    --git-branch="$GIT_REPO_BRANCH" \
    --git-path="charts" \
    --sync-wait \
    --source-format="helm" \
    --helm-release-name="infrastructure" \
    --helm-release-namespace="config-connector-system" # Or your target CNRM namespace
                                                     # Default CNRM install has SA in cnrm-system
                                                     # and operates at cluster scope unless
                                                     # namespaced configuration is set.
  log_info "Config Sync repository configured and syncing started."
fi

log_info "Bootstrap complete. GCP Config Controller is running and syncing from Git."
log_info "Monitor resource provisioning in GCP Console or via 'kubectl get <CNRM_KIND> -A' (e.g., 'kubectl get ContainerCluster -A')."
