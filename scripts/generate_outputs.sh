#!/bin/bash
# scripts/generate_outputs.sh
#
# Retrieves critical outputs from the provisioned GCP infrastructure.

set -euo pipefail

# --- Configuration Variables ---
GCP_PROJECT_ID=$(gcloud config get-value project)
GCP_REGION=$(gcloud config get-value compute/region)
CONFIG_CONTROLLER_NAME="openlane-config-controller" # Must match bootstrap name
GKE_WORKLOAD_CLUSTER_NAME="openlane-workload-cluster" # Must match gcp-gke-prod-cluster chart name
LOAD_BALANCER_IP_NAME="openlane-external-ip" # Must match gcp-lb-ingress chart name

log_info() {
  echo "INFO: $*"
}

log_error() {
  echo "ERROR: $*" >&2
  exit 1
}

# --- Main Logic ---
log_info "Generating infrastructure outputs for project: ${GCP_PROJECT_ID} in region: ${GCP_REGION}..."

# 1. Get GKE Workload Cluster Details
log_info "Retrieving GKE Workload Cluster API endpoint..."
GKE_ENDPOINT=""
# Use loop as cluster might not be ready immediately after Config Sync starts
for i in {1..10}; do
  GKE_ENDPOINT=$(gcloud container clusters describe "$GKE_WORKLOAD_CLUSTER_NAME" \
    --region "$GCP_REGION" --project="$GCP_PROJECT_ID" \
    --format="value(endpoint)" 2>/dev/null || true)
  if [ -n "$GKE_ENDPOINT" ]; then
    log_info "Workload GKE Cluster Endpoint: ${GKE_ENDPOINT}"
    break
  fi
  log_info "Waiting for GKE Workload Cluster to be ready... (Attempt $i/10)"
  sleep 30
done
if [ -z "$GKE_ENDPOINT" ]; then
  log_error "Workload GKE Cluster '${GKE_WORKLOAD_CLUSTER_NAME}' not found or not ready within timeout."
fi

# 2. Get External Load Balancer IP
log_info "Retrieving External Load Balancer IP..."
LOAD_BALANCER_IP=""
for i in {1..10}; do
  LOAD_BALANCER_IP=$(gcloud compute addresses describe "$LOAD_BALANCER_IP_NAME" \
    --global --project="$GCP_PROJECT_ID" \
    --format="value(address)" 2>/dev/null || true)
  if [ -n "$LOAD_BALANCER_IP" ]; then
    log_info "External Load Balancer IP: ${LOAD_BALANCER_IP}"
    break
  fi
  log_info "Waiting for Load Balancer IP to be provisioned... (Attempt $i/10)"
  sleep 20
done
if [ -z "$LOAD_BALANCER_IP" ]; then
  log_error "External Load Balancer IP '${LOAD_BALANCER_IP_NAME}' not found or not ready within timeout."
fi

# 3. Get CloudSQL Connection Name
log_info "Retrieving CloudSQL (PostgreSQL) Connection Name..."
CLOUDSQL_INSTANCE_NAME="openlane-postgresql-instance" # Must match chart name
CLOUDSQL_CONNECTION_NAME=""
for i in {1..5}; do
  CLOUDSQL_CONNECTION_NAME=$(gcloud sql instances describe "$CLOUDSQL_INSTANCE_NAME" \
    --project="$GCP_PROJECT_ID" \
    --format="value(connectionName)" 2>/dev/null || true)
  if [ -n "$CLOUDSQL_CONNECTION_NAME" ]; then
    log_info "CloudSQL Connection Name: ${CLOUDSQL_CONNECTION_NAME}"
    break
  fi
  log_info "Waiting for CloudSQL instance to be ready... (Attempt $i/5)"
  sleep 60
done
if [ -z "$CLOUDSQL_CONNECTION_NAME" ]; then
  log_error "CloudSQL instance '${CLOUDSQL_INSTANCE_NAME}' not found or not ready within timeout."
fi

# 4. Get Memorystore Redis Endpoint
log_info "Retrieving Memorystore Redis Host..."
REDIS_INSTANCE_NAME="openlane-redis-cache" # Must match chart name
REDIS_HOST=""
REDIS_PORT=""
for i in {1..5}; do
  REDIS_HOST=$(gcloud redis instances describe "$REDIS_INSTANCE_NAME" \
    --region "$GCP_REGION" --project="$GCP_PROJECT_ID" \
    --format="value(host)" 2>/dev/null || true)
  REDIS_PORT=$(gcloud redis instances describe "$REDIS_INSTANCE_NAME" \
    --region "$GCP_REGION" --project="$GCP_PROJECT_ID" \
    --format="value(port)" 2>/dev/null || true)
  if [ -n "$REDIS_HOST" ] && [ -n "$REDIS_PORT" ]; then
    log_info "Memorystore Redis Host: ${REDIS_HOST}:${REDIS_PORT}"
    break
  fi
  log_info "Waiting for Memorystore Redis to be ready... (Attempt $i/5)"
  sleep 45
done
if [ -z "$REDIS_HOST" ] || [ -z "$REDIS_PORT" ]; then
  log_error "Memorystore Redis instance '${REDIS_INSTANCE_NAME}' not found or not ready within timeout."
fi


# --- Summary Report ---
echo ""
echo "--- Infrastructure Deployment Summary ---"
echo "Workload GKE Cluster API Endpoint: ${GKE_ENDPOINT}"
echo "External Load Balancer IP:         ${LOAD_BALANCER_IP}"
echo "CloudSQL Connection Name (PostgreSQL): ${CLOUDSQL_CONNECTION_NAME}"
echo "Memorystore Redis Host:            ${REDIS_HOST}:${REDIS_PORT}"
echo "-----------------------------------------"

log_info "To connect to GKE Workload Cluster, run: gcloud container clusters get-credentials ${GKE_WORKLOAD_CLUSTER_NAME} --region ${GCP_REGION} --project ${GCP_PROJECT_ID}"
log_info "Remember to update your DNS records (e.g., A record for host '${LOAD_BALANCER_IP}') with the Load Balancer IP."
log_info "Use Cloud SQL Proxy for connecting to CloudSQL from outside GKE."