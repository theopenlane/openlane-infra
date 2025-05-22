
# GCP Resource Chart Descriptions

This file documents the GCP resource charts and their interrelationships.

## Charts

| Chart | Description |
|-------|-------------|
| **openlane-gcp-vpc-network** | Provisions a Google VPC Network using Config Connector. |
| **openlane-gcp-subnetwork** | Creates a subnetwork within the provisioned VPC. |
| **openlane-gcp-compute-router** | Enables routing for VPC and NAT. |
| **openlane-gcp-cloud-nat** | Adds NAT to enable egress from private subnets. |
| **openlane-gcp-compute-address** | Allocates static external IP addresses. |
| **openlane-gcp-dns-zone** | Manages Cloud DNS zones. |
| **openlane-gcp-bucket** | Provisions Cloud Storage buckets. |
| **openlane-gcp-iam-custom-role** | Defines reusable IAM roles. |
| **openlane-gcp-service-account** | Creates service accounts and optionally keys. |
| **openlane-gcp-iam-policy-members** | Grants IAM bindings across services. |
| **openlane-external-dns** | Bridges Kubernetes Services to Cloud DNS records. |
