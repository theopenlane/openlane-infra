[![Build status](https://badge.buildkite.com/34ad31fe4231b2953cd3f2d116364d21a39b2a4dbf1eea539a.svg)](https://buildkite.com/theopenlane/openlane-infra?branch=main)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache2.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=theopenlane_openlane-infra&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=theopenlane_openlane-infra)

# Openlane Infrastructure Provisioning with GCP Config Controller and Config Connector

This repository contains Helm charts and scripts designed to provision production-grade GCP infrastructure using a GitOps approach, powered by **GCP Config Controller** (which includes managed Config Sync and **Config Connector**). The infrastructure includes a GKE Autopilot cluster, shared VPC, DNS, Load Balancing (ingress), CloudSQL, and Memorystore Redis.

This setup is designed for **highly automated, declarative infrastructure management**, where desired state is defined in Git and continuously reconciled by Config Sync leveraging Config Connector.


## Architecture Overview

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

## Key Components

*   **Helm Charts (`charts/`):** Define the desired state of GCP resources as Config Connector Custom Resources.
    *   `gcp-project`: For creating new GCP projects and managing essential APIs/IAM.
    *   `gcp-vpc`: Defines shared VPC host and service networks, subnets, and firewalls.
    *   `gcp-gke-prod-cluster`: Configures a production-grade GKE Autopilot cluster within a target project.
    *   `gcp-dns`: Manages GCP DNS Managed Zones and RecordSets.
    *   `gcp-cloudsql`: Provisions managed PostgreSQL instances with secure defaults.
    *   `gcp-memorystore-redis`: Provisions managed Memorystore Redis instances used for session storage and caching by Openlane.
    *   `gcp-lb-ingress`: Sets up external HTTP(S) Load Balancers and associated resources for cluster ingress.
    *   `gcp-config-controller`: (Internal use) Represents the Config Controller instance itself. While the instance is created via `gcloud`, this chart's values affect its configuration.
*   **Scripts (`scripts/`):** Bootstrap the initial environment and manage initial GCP configurations.
    *   `bootstrap_config_controller.sh`: The underlying "inception" script to get the Config Controller running and Git Sync configured - once this is done, the rest of the infrastructure is managed via GitOps and the config controller "takes over" the existing running resources, so if changes are needed to the Config Controller, they can be done via Git.
    *   `install_tools.sh`: Helper script to ensure all necessary local tools are installed.
    *   `generate_outputs.sh`: Extracts crucial connection information post-deployment.
*   **`Taskfile.yml`:** Uses `go-task` for orchestrating the provisioning and management workflows and for executing any scripts within the respository to ensure a consistent and repeatable process as we;; as to ensure that the correct tools are installed and available in the local environment.

## Design Rationale

When determining the best approach for provisioning Openlane's infrastructure as well as deploying and managing the Openlane application stack, we evaluated several options and providers. The founders of Openlane have extensive experience in the DevOps and SRE space, and we have a strong preference for using **GitOps** principles to manage our infrastructure. We also wanted to ensure that the solution was fully declarative, easy to manage, and would be generally portable to other cloud providers if we chose to do so in the future.

Additionally, early on we made a lot of decisions around our application stack that involved us ground-up writing things like our own authentication and authorization system because we believed that integrating a dozen vertical cloud providers into the open source stack dramatically reduced the relevancy to the open source community. We wanted to be sure we could run Openlane on any cloud provider, and that we could do so in a way that was easy to manage and maintain.

We chose to use **GCP Config Connector** for the following reasons:
*   **Declarative Management:** Config Connector allows for a fully declarative approach to managing GCP resources, which aligns with the GitOps philosophy.
*   **Native Kubernetes Integration:** Config Connector resources are defined as Kubernetes Custom Resources, making it easier to manage GCP resources alongside Kubernetes resources.
*   **GitOps Compatibility:** Config Connector works seamlessly with GitOps tools like Config Sync and ArgoCD, allowing for a unified workflow for managing both infrastructure and applications.
*   **Reduced Complexity:** Using Config Connector reduces the complexity of managing GCP resources, as it eliminates the need for a separate Terraform state file and management process.
*   **Real-time Reconciliation:** Config Connector continuously reconciles the desired state defined in Git with the actual state of GCP resources, ensuring that any drift is automatically corrected.
*   **Seamless Integration with GKE:** Config Connector is designed to work seamlessly with GKE, making it easier to manage Kubernetes resources and GCP resources together.

### Considered and Rejected Alternatives

- Terraform: While Terraform is a powerful tool for managing infrastructure, it introduces additional complexity with state management and does not natively integrate with Kubernetes resources. The GitOps workflow would also be more complex, as Terraform would require separate state management and reconciliation processes.
- Pulumi / Crossplane / other Infrastructure as Code tools: These tools offer similar capabilities to Terraform but also introduce additional complexity and do not provide the same level of integration with Kubernetes resources as Config Connector.
- `kpt` or `kustomize`: Both of these tools could be used in conjunction with Config Connector (allowing for templating and customization of declarative resources), but `kpt` is not as widely adopted in the Kubernetes ecosystem as Helm. Additionally, `kustomize` does not support the same level of templating and customization as Helm, which would make it more difficult to manage complex configurations.

## Prerequisites

Before you begin, ensure you have the following:

1.  **GCP Account and Project:** A GCP project where you have `owner` or equivalent permissions. This project will implicitly become your "management" project, hosting the Config Controller.
2.  **GCP Billing Account:** A billing account linked to your GCP project.
3.  **Local Tools:**
    *   `gcloud CLI`: Authenticated and configured
    *   `helm`: For linting/templating charts
    *   `kubectl`: For interacting with Kubernetes clusters
    *   `go-task`: The task runner used in this project
    *   **Clone this repository:** `git clone https://github.com/theopenlane/openlane-infra.git` and `cd openlane-infra`.
4.  **Git Repository for Config Sync:** This repository should be accessible by Config Sync. If it's private, you'll need to follow GCP's documentation to configure authentication. For a public repo, no extra steps are needed.


## 🌍 Environments & GitOps Flow

Each environment (e.g., dev, prod) uses its own `values-*.yaml` to render manifests.

1. Helm chart is rendered into `rendered/<env>/` using CLI
2. Config Sync watches the rendered directory and applies changes to GKE
3. ArgoCD syncs app state from Git

```bash
render ➝ commit ➝ Config Sync ➝ apply to cluster
```

## 🔐 Sealed Secrets

### Encrypt a secret:
```bash
kubeseal --format yaml < secret.yaml > sealed-secret.yaml
```

### Example Secret Format:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
  namespace: openlane
type: Opaque
data:
  password: <base64-encoded>
```

### Apply using Config Sync:

Place sealed secret into `secrets/` and reference it in your root-sync repo


## ⚙️ CLI Tool

Use the Openlane CLI to streamline operations:

### Render Helm manifests:

```bash
./openlane render --env dev
```

### Bootstrap Config Sync:
```bash
./openlane bootstrap
```

### Encrypt a secret (wrapper for kubeseal):
```bash
./openlane seal --input secrets/my-secret.yaml --output secrets/my-sealed.yaml
```

---

## 📦 Billing Configuration

Billing account is specified in `openlane-bootstrap/project-setup.yaml`:

```yaml
billingAccount: 01AC20-2CEAE3-8BB367
```

Update this value per your GCP billing account if needed


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

We use [Chart Testing](https://github.com/helm/chart-testing) to ensure our charts follow best practices. To lint a chart, run:

```bash
docker run --rm -it -w /charts -v $(pwd)/../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/<chart-name> --config /charts/charts/<chart-name>/ct.yaml
```

### Documentation Generation

Documentation is automatically generated from chart annotations using helm-docs. To manually generate documentation:

```bash
helm-docs /path/to/charts/<chart-name>
```

