#!/bin/bash
set -euo pipefail

# Vars - replace as needed
ENV=$1 # dev or prod
PROJECT_ID="openlane-$ENV"
CLUSTER_NAME="config-host-$ENV"
REGION="us-central1"
LOCATION="us-central1"
SECRET_NAME="git-creds"

# Create the config controller cluster
gcloud anthos config controller create $CLUSTER_NAME --location=$LOCATION --project=$PROJECT_ID

# Get cluster credentials
gcloud container clusters get-credentials $CLUSTER_NAME --location=$LOCATION --project=$PROJECT_ID

# Set IAM policy binding for config connector SA
SA="service-${PROJECT_ID}@gcp-sa-configmanagement.iam.gserviceaccount.com"
gcloud projects add-iam-policy-binding $PROJECT_ID   --member="serviceAccount:${SA}"   --role="roles/owner"

# Create NAT and Cloud Router if needed
gcloud compute routers create ${CLUSTER_NAME}-router   --network=default   --region=$REGION   --project=$PROJECT_ID

gcloud compute routers nats create ${CLUSTER_NAME}-nat   --router=${CLUSTER_NAME}-router   --auto-allocate-nat-external-ips   --nat-all-subnet-ip-ranges   --enable-logging   --region=$REGION   --project=$PROJECT_ID

# Create Git authentication secret (optional if using private repo)
# kubectl create secret generic git-creds --namespace=config-management-system #   --from-file=username=./username.txt --from-file=password=./password.txt

# Apply the appropriate RootSync
kubectl apply -f configsync/root-sync-$ENV.yaml