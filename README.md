[![Build status](https://badge.buildkite.com/34ad31fe4231b2953cd3f2d116364d21a39b2a4dbf1eea539a.svg)](https://buildkite.com/theopenlane/openlane-infra?branch=main)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache2.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=theopenlane_openlane-infra&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=theopenlane_openlane-infra)

# Openlane Infrastructure

This repository bootstraps the Openlane compliance automation platform on Google Cloud using GitOps principles with ArgoCD and Config Sync

## 🧱 Architecture Overview

Openlane leverages:

- **GKE (Google Kubernetes Engine)** for container orchestration
- **ArgoCD** for continuous delivery using GitOps
- **Config Sync** to manage and sync infrastructure from Git
- **Helm** for application templating
- **Sealed Secrets** to manage sensitive data securely in Git
- **Buildkite** for CI pipelines

## 📁 Directory Structure

```bash
.
├── charts/                  # Helm charts for Openlane components
├── configsync/              # Config Sync root-sync declarations per env
├── rendered/                # Helm rendered output for dev/prod environments
├── secrets/                 # Sealed Secrets files
├── templates/               # Terraform/KCC YAML templates
├── cli/                     # Go-based CLI for rendering and setup
├── scripts/                 # Bootstrap and helper scripts
├── values.yaml              # Shared Helm values
├── values-dev.yaml          # Dev-specific Helm overrides
├── values-prod.yaml         # Prod-specific Helm overrides
├── project-setup.yaml       # GCP project and billing setup
└── README.md
```


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

