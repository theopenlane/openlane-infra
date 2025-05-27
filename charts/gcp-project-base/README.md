# gcp-project-base

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

## Prerequisites

- Helm v3
- Config Connector installed (v1.6.0)

## Description

Reusable chart for defining a GCP Project and its common resources.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| bigquery.enabled | bool | `false` |  |
| billingAccountId | string | `"OVERWRITE_ME"` |  |
| cloudsql.enabled | bool | `false` |  |
| commonAppConfig | object | `{}` |  |
| dnsZone.enabled | bool | `false` |  |
| envCapitalizedName | string | `"Default"` |  |
| envName | string | `"default"` |  |
| firewallRules | object | `{}` |  |
| folders | object | `{}` |  |
| gkeCluster.enabled | bool | `false` |  |
| isLoggingProject | bool | `false` |  |
| isSharedVpcHost | bool | `false` |  |
| kms | object | `{}` |  |
| logSinks | object | `{}` |  |
| memorystore.enabled | bool | `false` |  |
| network | object | `{}` |  |
| orgId | string | `"OVERWRITE_ME"` |  |
| primaryRegion | string | `"us-east4"` |  |
| project.apis | list | `[]` |  |
| project.folderRef | string | `"folders/default-folder-id"` |  |
| project.gcpProjectName | string | `"Default GCP Project"` |  |
| project.id | string | `""` |  |
| project.name | string | `"default-project"` |  |
| serviceProjects | object | `{}` |  |
| sharedVpcHostDev | object | `{}` |  |
| sharedVpcHostProd | object | `{}` |  |
| storage.enabled | bool | `false` |  |

## Installing the Chart

### With Helm

To install the chart with the release name `my-release`:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/gcp-project-base
```

### With ArgoCD

Add new application as:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: gcp-project-base
spec:
  project: infra

  source:
    repoURL: "https://theopenlane.github.io/openlane-infra"
    targetRevision: "0.1.0"
    chart: gcp-project-base
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/gcp-project-base --config /charts/charts/gcp-project-base/ct.yaml
```

### Run pluto

In order to check if the api-version used in this chart are not deprecated, or worse, removed, we use pluto to check it:

```
docker run --rm -it -v $(pwd):/apps -v pluto:/pluto alpine/helm:3.17 template gcp-project-base . -f tests/pluto/values.yaml --output-dir /pluto
docker run --rm -it -v pluto:/data us-docker.pkg.dev/fairwinds-ops/oss/pluto:v5 detect-files -d /data -o yaml --ignore-deprecations -t "k8s=v1.31.0,cert-manager=v1.17.0,istio=v1.24.0" -o wide
docker volume rm pluto
```

