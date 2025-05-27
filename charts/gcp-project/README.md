# openlane-gcp-project

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

## Prerequisites

- Helm v3
- Config Connector installed (v1.6.0)

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> |  |

## Description

A Helm chart that Creates GCP projects and configuration Config Connector

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apiEnablement | object | `{"enabled":true,"services":["servicemanagement.googleapis.com","serviceusage.googleapis.com","container.googleapis.com","compute.googleapis.com","sqladmin.googleapis.com","dns.googleapis.com","redis.googleapis.com","sourcerepo.googleapis.com","connectgateway.googleapis.com","anthos.googleapis.com","gkehub.googleapis.com","cloudaudit.googleapis.com"]}` | List of GCP APIs to enable within this project. |
| global.abandon | bool | `true` | If true, Keep the resource even after the kcc resource deletion. |
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| iam | object | `{"enabled":true,"projectBindings":[{"member":"serviceAccount:service-{{ .Values.configControllerProjectNumber }}@gcp-sa-config-controller.iam.gserviceaccount.com","role":"roles/owner"}],"serviceAccounts":[{"displayName":"Service Account for Openlane Application","name":"openlane-app-sa","roles":["roles/viewer","roles/secretmanager.secretAccessor","roles/cloudsql.client","roles/container.viewer"]}]}` | IAM settings for the project. |
| iam.projectBindings | list | `[{"member":"serviceAccount:service-{{ .Values.configControllerProjectNumber }}@gcp-sa-config-controller.iam.gserviceaccount.com","role":"roles/owner"}]` | IAM Members to bind to roles at the project level.    This is for project-level permissions to users, groups, or service accounts.    Often used to grant the Config Controller's managed SA permissions to new service projects. |
| iam.serviceAccounts | list | `[{"displayName":"Service Account for Openlane Application","name":"openlane-app-sa","roles":["roles/viewer","roles/secretmanager.secretAccessor","roles/cloudsql.client","roles/container.viewer"]}]` | Service accounts to create within this project. |
| iam.serviceAccounts[0].roles[0] | string | `"roles/viewer"` | Roles for the application service account. Add specific roles as needed by the application. |
| project | object | `{"autoCreateNetwork":false,"billingAccountRef":{"external":""},"description":"Openlane application service project","enabled":true,"name":"openlane-service-project","projectId":"","projectNumber":""}` | Project specific settings |
| project.autoCreateNetwork | bool | `false` | Parent of the project, either an Organization or a Folder.    If not set, project is created under the billing account's default resource hierachy. folderRef:   external: "folders/1234567890" # Example organizationRef:   external: "organizations/1234567890" # Example controls whether or not deafult network is created |
| project.billingAccountRef | object | `{"external":""}` | Reference to the Billing Account ID that the project will be linked to.    This is crucial for project creation.    Example: "012345-6789BF-012345" |
| project.description | string | `"Openlane application service project"` | Description for the project. |
| project.name | string | `"openlane-service-project"` | Display name for the GCP project. |
| project.projectId | string | `""` | The desired GCP project ID. Must be globally unique. |
| project.projectNumber | string | `""` | The project number is dynamically assigned by GCP when the project is created. |

## Installing the Chart

### With Helm

To install the chart with the release name `my-release`:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/openlane-gcp-project
```

### With ArgoCD

Add new application as:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: openlane-gcp-project
spec:
  project: infra

  source:
    repoURL: "https://theopenlane.github.io/openlane-infra"
    targetRevision: "0.1.0"
    chart: openlane-gcp-project
    path: ''
    helm:
      values: |

  destination:
    server: https://kubernetes.default.svc
    namespace: "cnrm-system"
  syncPolicy:
    automated:
      prune: true
```

## Develop

### Update documentation

Chart documentation is generated with [helm-docs](https://github.com/norwoodj/helm-docs) from `values.yaml` file.
After file modification, regenerate README.md with command:

```bash
docker run --rm -it -v $(pwd):/helm --workdir /helm jnorwood/helm-docs:v1.14.2 helm-docs
```

### Run linter

```bash
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-project --config /charts/charts/openlane-gcp-project/ct.yaml
```

### Run pluto

In order to check if the api-version used in this chart are not deprecated, or worse, removed, we use pluto to check it:

```
docker run --rm -it -v $(pwd):/apps -v pluto:/pluto alpine/helm:3.17 template openlane-gcp-project . -f tests/pluto/values.yaml --output-dir /pluto
docker run --rm -it -v pluto:/data us-docker.pkg.dev/fairwinds-ops/oss/pluto:v5 detect-files -d /data -o yaml --ignore-deprecations -t "k8s=v1.31.0,cert-manager=v1.17.0,istio=v1.24.0" -o wide
docker volume rm pluto
```

