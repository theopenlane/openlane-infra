[![Chart Publish](https://github.com/theopenlane/openlane-infra/actions/workflows/charts-publish.yml/badge.svg?branch=main)](https://github.com/heopenlane/openlane-infra/actions/workflows/publish.yml)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache2.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=theopenlane_openlane-infra&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=theopenlane_openlane-infra)

> NOTE: This repository is currently in **beta**. It is not yet production-ready, but we are actively working on it. Please use with caution!

# Openlane Infrastructure Provisioning

This repository contains Helm charts and scripts designed to provision production-grade GCP infrastructure using a GitOps approach, powered by **GCP Config Controller** (which includes managed Config Sync and **Config Connector**). The infrastructure includes a GKE Autopilot cluster, shared VPC, DNS, Load Balancing (ingress), CloudSQL, and Memorystore Redis.

This setup is designed for **highly automated, declarative infrastructure management**, where desired state is defined in Git and continuously reconciled by Config Sync leveraging Config Connector.


## Architecture Overview

### Inheritance and Structure

We implement a three-tier inheritance model for configuration. The focus of this approach is configuration inheritance, emphasizing clear separation of concerns, secure-by-default settings, and scalability for a multi-environment, multi-project GCP organization.

The underlying tiers of the structured charts are:

1. Bootstrap Chart (openlane-gcp-bootstrap):
    * Defines global configurations, folders, organization-level policies, KMS resources, and acts as an orchestrator that dynamically generates ArgoCD Application resources for each specific GCP project.

1. Project Chart (gcp-project):
    * A reusable blueprint for a single GCP project. It creates the KCC Project resource, enables necessary APIs, sets up project-level IAM, and acts as a parent for specific resource charts deployed within that project.

1. Resource Charts (gcp-gke-cluster, gcp-cloudsql-postgresql, etc.):
    * Define granular GCP resources (e.g., GKE clusters, BigQuery datasets, Storage buckets) and are deployed as sub-charts of the gcp-project chart.

### Patterns and Practices

This repository follows several key patterns and practices to ensure a robust, scalable, and maintainable infrastructure setup:

* **GCP Foundations Blueprint Alignment:** We aim for strong network segmentation (e.g., separate Shared VPCs for production and non-production), centralized logging, and least-privilege IAM, as recommended by GCP's security best practices.
* **KCC Namespace Mode:** Each GCP Project is mapped to a dedicated Kubernetes Namespace via KCC's Namespace resource. This ensures all KCC resources deployed into that specific Kubernetes Namespace land in the correct GCP Project.
* **ArgoCD App-of-Apps Pattern:** A master ArgoCD Application (root-apps.yaml) orchestrates the deployment of environment-specific bootstrap applications, which in turn generate and manage ArgoCD Applications for each individual GCP project.

### High-level Workflow

With the goal of being able to idempotently re-establish the entire Openlane infrastructure (and as an added benefit the steps others could follow to set up their own Openlane infrastructure), the workflow is as follows:

1.  **Bootstrap Phase (Manual / Scripted):**
    *   An initial GCP Project is created and then enabled with required APIs.
    *   The `bootstrap_config_controller.sh` script is executed to provision a **GCP Config Controller** instance. This service provides a fully managed Kubernetes cluster, pre-installed with Config Sync and Config Connector.
    *   The Config Controller is configured to sync from *this Git repository* pulling from `rendered/<env>/` (e.g., `rendered/dev/` or `rendered/prod/`) where the Helm charts are rendered.
    *   The `rendered/<env>/` directory contains the rendered output of the Helm charts, which are generated using the Openlane CLI tool or Helm CLI directly.
    *   The `configsync/` directory contains the root-sync declarations for each environment (e.g., dev, prod) that Config Sync will use to watch and apply changes.
    *   The `secrets/` directory contains Sealed Secrets files, which are encrypted secrets that can be safely stored in Git and decrypted by the Config Controller.

2.  **Infrastructure Deployment (via Config Sync and Config Connector):**
    *   Once synced, **Config Sync** automatically applies the Helm charts (which declare **Config Connector Custom Resources**) from this repository to the Config Controller's Kubernetes API.
    *   **Config Connector**, running within the Config Controller, observes these CRs and provisions the corresponding GCP resources (VPC, GKE, CloudSQL, DNS, LB, Redis) in the target GCP projects.
    *   Any changes pushed to the Git repository are automatically detected and reconciled by Config Sync, keeping your GCP infrastructure in sync with your Git definitions.

3.  **Application Deployment (via ArgoCD):**
    *   **ArgoCD** is deployed onto the **Config Controller cluster**. It acts as a Kubernetes-native GitOps tool for managing application deployments.
    *   ArgoCD is configured to monitor a separate Git repository (e.g., `theopenlane/openlane-application`) containing the application's Kubernetes manifests.
    *   ArgoCD then deploys the Openlane application to the provisioned **Workload GKE Autopilot cluster**.

### **Repo Charts Inventory**

This repository organizes GCP infrastructure definitions using Helm charts. Each chart defines a specific aspect or set of resources, following a hierarchical deployment model.

| Chart Name                     | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| :----------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`openlane-gcp-bootstrap`](charts/openlane-gcp-bootstrap/README.md)       | **Bootstrap / Orchestrator Chart.** This is the top-level chart that defines the fundamental GCP organizational structure (folders, organization policies, global KMS) and orchestrates the deployment of individual GCP projects by generating ArgoCD `Application` resources. It acts as the central control plane for environment setup.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| [`gcp-project`](charts/gcp-project/README.md)                  | **Project Chart.** A reusable blueprint for a single GCP project. It creates the KCC `Project` resource and its associated Kubernetes `Namespace`, enables required GCP APIs, sets up basic project-level IAM, and acts as a parent for specific resource charts like GKE clusters, BigQuery datasets, and storage. It also handles conditional deployment of Shared VPC network components if acting as a Shared VPC host.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| [`gcp-gke-cluster`](charts/gcp-gke-cluster/README.md)          | **Resource Chart: GCP GKE Cluster.** Defines the configuration for a Google Kubernetes Engine (GKE) cluster, including cluster-level settings, node pools, and Workload Identity.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| [`openlane-gcp-bigquery`](charts/openlane-gcp-bigquery/README.md) | **Resource Chart: GCP BigQuery Dataset.** Defines the configuration for a BigQuery dataset, including its location, default expiration, and Customer-Managed Encryption Key (CMEK) settings.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| [`gcp-bucket`](charts/gcp-bucket/README.md)                   | **Resource Chart: GCP Cloud Storage Bucket.** Defines the configuration for a Cloud Storage bucket, including its location, lifecycle rules, and Customer-Managed Encryption Key (CMEK) settings.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [`gcp-cloudsql-postgresql`](charts/gcp-cloudsql-postgresql/README.md) | **Resource Chart: GCP Cloud SQL PostgreSQL.** Defines a managed PostgreSQL database instance, including its version, tier, network settings (e.g., private IP), and high-availability options.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| [`gcp-memorystore-redis`](charts/gcp-memorystore-redis/README.md) | **Resource Chart: GCP Memorystore for Redis.** Defines a managed Redis instance, including its tier, memory size, and network configuration.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| [`gcp-dns-zone`](charts/gcp-dns-zone/README.md)              | **Resource Chart: GCP Cloud DNS Managed Zone.** Defines a private or public DNS managed zone and associated record sets within Cloud DNS.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| [`argocd`](charts/argocd/README.md)                          | **Shared Service Chart: ArgoCD.** Deploys the ArgoCD GitOps continuous delivery tool into the Kubernetes cluster. Used for managing the deployment of all other charts.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| [`cert-manager`](charts/cert-manager/README.md)                  | **Shared Service Chart: cert-manager.** Deploys the cert-manager tool for automated X.509 certificate management within Kubernetes. Includes support for GCP DNS01 challenges.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [`external-dns`](charts/external-dns/README.md)                  | **Shared Service Chart: ExternalDNS.** Deploys ExternalDNS to automatically synchronize Kubernetes Ingresses and Services with Cloud DNS records.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| [`gcp-cloud-nat`](charts/gcp-cloud-nat/README.md)              | **Resource Chart: GCP Cloud NAT.** Configures Network Address Translation for private GKE clusters or other VM instances that require outbound internet connectivity without public IPs.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| [`gcp-compute-address`](charts/gcp-compute-address/README.md)    | **Resource Chart: GCP Compute Address.** Defines an Internal or External IP address resource within GCP Compute Engine. Useful for reserved IPs for Load Balancers or specific services.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| [`gcp-compute-router`](charts/gcp-compute-router/README.md)      | **Resource Chart: GCP Compute Router.** Defines a Cloud Router, used for Cloud NAT, Cloud VPN, or Cloud Interconnect.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| [`gcp-config-controller`](charts/gcp-config-controller/README.md) | **Resource Chat: GCP Config Controller.** Defines a Config Controller instance, a managed service offering for GitOps management and policy enforcement (built on GKE and Anthos Config Management).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| [`gcp-iam-policy-members`](charts/gcp-iam-policy-members/README.md) | **Resource Chart: GCP IAM Policy Members.** Defines IAM policy bindings for various GCP resources, granting roles to users, service accounts, or groups. Provides granular access control.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| [`gcp-lb`](charts/gcp-lb/README.md)                          | **Resource Chart: GCP Load Balancers.** Configures various GCP Load Balancer components, including forwarding rules, backend services, URL maps, and SSL certificates.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| [`gcp-service-account`](charts/gcp-service-account/README.md)    | **Resource Chart: GCP Service Account.** Defines a GCP Service Account, often used for applications or CI/CD pipelines.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| [`gcp-subnetwork`](charts/gcp-subnetwork/README.md)          | **Resource Chart: GCP Compute Subnetwork.** Defines a subnetwork within a VPC network, used for IP range allocation for VMs, GKE nodes, or other services.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| [`gcp-vpc-network`](charts/gcp-vpc-network/README.md)        | **Resource Chart: GCP Compute VPC Network.** Defines a Virtual Private Cloud (VPC) network, providing network isolation and connectivity across GCP projects.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| [`gcp-workload-identity`](charts/gcp-workload-identity/README.md) | **Resource Chart: GCP Workload Identity.** Configures Workload Identity for GKE clusters, enabling Kubernetes service accounts to act as GCP service accounts.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

![](assets/architecture-diagram.png)

## Prerequisites

Before you begin, ensure you have the following:

1.  **GCP Account and Project:** A GCP project where you have `owner` or equivalent permissions. This project will implicitly become your "management" project, hosting the Config Controller.
1.  **GCP Billing Account:** A billing account linked to your GCP project.
1.  **Local Tools:**
    *   `gcloud CLI`: Authenticated and configured
    *   `helm`: For linting/templating charts
    *   `kubectl`: For interacting with Kubernetes clusters - preferred installation is via gcloud `gcloud components install kubectl`
    *   `go-task`: The task runner used in this project
1.  **Optional, but recommended local tools**
    *    `nomos`: Once you have gcloud installed, you can install `nomos` via `gcloud components install nomos`
    *    `auth-plugin`: `gcloud components install gke-gcloud-auth-plugin`
    *    `shell completion`: `echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)' >> ~/.zshrc`

## Chart Scaffolding

The repository includes a custom shell script (`openlane-chart.sh`) to scaffold new charts. This tool automates the process of:

- Creating a new Helm chart
- Removing default templates
- Updating `Chart.yaml` with dependency details (including optional alias support)
- Rendering default values and external templates
- Building Helm dependencies
- Generating documentation with helm-docs

Example usage:

```bash
./scripts/openlane-chart.sh create
  --name my-new-chart
  --dependency-url https://charts.example.com
  --dependency-chart-name example-chart
  --dependency-chart-version 1.2.3
  --dependency-alias exchart
```

### Linting and Testing

We use [Chart Testing](https://github.com/helm/chart-testing) to ensure our charts follow best practices. To lint a chart, run either:

```
task lint
```
or

```bash
docker run --rm -it -w /charts -v $(pwd)/../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/<chart-name> --config /charts/charts/<chart-name>/ct.yaml
```

### Documentation Generation

Documentation is automatically generated from chart annotations using helm-docs. To manually generate documentation:

```bash
task docs
```

## Shared VPC Setup

This repository supports GCP Shared VPC using Config Connector resources and Helm charts.

- Use `gcp-bootstrap` with `sharedVPC.enabled` and your host/service project IDs to generate `ComputeSharedVPCServiceProject` bindings.
- The host project owns the VPC and subnets; the service projects attach and use them.
- Use `gcp-iam-policy-members` to grant `roles/compute.networkUser` to your service projects or service accounts.
- In your workload resource charts (GKE, VM), reference the shared VPC and subnet using the `external` field.

**Example usage in `charts/gcp-bootstrap/values.yaml`:**
```yaml
sharedVPC:
  enabled: true
  hostProjectId: my-shared-vpc-host
  serviceProjects:
    - my-service-project-1
    - my-service-project-2
```

## Project and Folder Hierarchy

```bash
organization
├── bootstrap (folder)
│   ├── prod-bootstrap-project
│   └── dev-bootstrap-project
├── common (folder)
│   ├── sharedInfra (folder)
│   │   ├── common-shared-kms-project
│   │   └── common-shared-secrets-project
│   ├── networking (folder)
│   │   └── common-shared-network-project
│   ├── signals (folder)
│   │   ├── common-shared-logging-project
│   │   └── common-shared-monitoring-project
│   └── billing (folder)
│       └── common-billing-project
├── prod (folder)
│   ├── networking (folder)
│   │   └── prod-shared-network-project
│   ├── sharedInfra (folder)
│   │   ├── prod-shared-kms-project
│   │   └── prod-shared-secrets-project
│   ├── signals (folder)
│   │   ├── prod-signals-logging-project
│   │   └── prod-signals-monitoring-project
│   ├── billing (folder)
│   │   └── prod-billing-project
│   └── apps (folder)
│       └── prod-apps-project
└── dev (folder)
    ├── networking (folder)
    │   └── dev-shared-network-project
    ├── sharedInfra (folder)
    │   ├── dev-shared-kms-project
    │   └── dev-shared-secrets-project
    ├── signals (folder)
    │   ├── dev-signals-logging-project
    │   └── dev-signals-monitoring-project
    ├── billing (folder)
    │   └── dev-billing-project
    └── apps (folder)
        └── dev-apps-project
```

## GCP Notes

To get nodes of a specific type or performance you need to annotate your deployment

```yaml
cloud.google.com/compute-class: "COMPUTE_CLASS"
kubernetes.io/arch: ARCHITECTURE # if you want a specific CPU architecture
```
