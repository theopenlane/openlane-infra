# Openlane Infrastructure

This repository bootstraps the Openlane compliance automation platform on Google Cloud using GitOps principles with ArgoCD and Config Sync.

---

## 🧱 Architecture Overview

Openlane leverages:

- **GKE (Google Kubernetes Engine)** for container orchestration
- **ArgoCD** for continuous delivery using GitOps
- **Config Sync** to manage and sync infrastructure from Git
- **Helm** for application templating
- **Sealed Secrets** to manage sensitive data securely in Git
- **Buildkite** for CI pipelines

---

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

---

## 🌍 Environments & GitOps Flow

Each environment (e.g., dev, prod) uses its own `values-*.yaml` to render manifests.

1. Helm chart is rendered into `rendered/<env>/` using CLI.
2. Config Sync watches the rendered directory and applies changes to GKE.
3. ArgoCD syncs app state from Git.

```bash
render ➝ commit ➝ Config Sync ➝ apply to cluster
```

---

## 🧩 Permissions & Team Roles

- **Platform Admins**
  - Own bootstrap, cluster infra, Helm rendering, and secrets management.
  - Use `openlane` CLI for sealed secrets and rendering.
- **App Teams**
  - Contribute app-specific manifests/values.
  - Commit via PR to Git repositories.

---

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
Place sealed secret into `secrets/` and reference it in your root-sync repo.

---

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

Billing account is specified in `project-setup.yaml`:
```yaml
billingAccount: 01AC20-2CEAE3-8BB367
```

Update this value per your GCP billing account if needed.

---

## 🛠️ Troubleshooting

- ❗ ArgoCD not syncing? Ensure Helm chart is rendered and committed.
- 🔐 Secrets failing? Validate kubeseal install and cluster's SealedSecrets controller.
- ⚡ CI stuck? Check `.buildkite/pipeline.yml` for steps.

---

## 📣 Contribution

Openlane is open source. Visit [https://github.com/theopenlane](https://github.com/theopenlane) to contribute.

---

## 📄 License

MIT License.
