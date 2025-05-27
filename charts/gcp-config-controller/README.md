# openlane-gcp-kcc

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

## Prerequisites

- Helm v3
- Config Connector installed (v1.6.0)

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> |  |

## Description

A Helm chart that manages a Config Connector GCP instance

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.abandon | bool | `true` | If true, Keep the Compute Address even after the kcc resource deletion. |
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| location | string | `"us-central1"` |  |
| managementConfig.fullManagementConfig.clusterCidrBlock | string | `""` |  |
| managementConfig.fullManagementConfig.clusterNamedRange | string | `""` |  |
| managementConfig.fullManagementConfig.masterIPv4CidrBlock | string | `""` |  |
| managementConfig.fullManagementConfig.networkRef.external | string | `""` |  |
| managementConfig.fullManagementConfig.servicesCidrBlock | string | `""` |  |
| managementConfig.fullManagementConfig.servicesNamedRange | string | `""` |  |
| managementConfig.standardManagementConfig.clusterCidrBlock | string | `""` |  |
| managementConfig.standardManagementConfig.clusterNamedRange | string | `""` |  |
| managementConfig.standardManagementConfig.masterIPv4CidrBlock | string | `""` |  |
| managementConfig.standardManagementConfig.networkRef.external | string | `""` |  |
| managementConfig.standardManagementConfig.servicesCidrBlock | string | `""` |  |
| managementConfig.standardManagementConfig.servicesNamedRange | string | `""` |  |
| name | string | `"openlane-config-controller"` |  |
| projectRef.external | string | `""` |  |
| projectRef.name | string | `""` |  |
| projectRef.namespace | string | `""` |  |
| resourceID | string | `""` |  |
| usePrivateEndpoint | bool | `false` |  |

## Installing the Chart

### With Helm

To install the chart with the release name `my-release`:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/openlane-gcp-kcc
```

### With ArgoCD

Add new application as:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: openlane-gcp-kcc
spec:
  project: infra

  source:
    repoURL: "https://theopenlane.github.io/openlane-infra"
    targetRevision: "0.1.0"
    chart: openlane-gcp-kcc
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-kcc --config /charts/charts/openlane-gcp-kcc/ct.yaml
```

### Run pluto

In order to check if the api-version used in this chart are not deprecated, or worse, removed, we use pluto to check it:

```
docker run --rm -it -v $(pwd):/apps -v pluto:/pluto alpine/helm:3.17 template openlane-gcp-kcc . -f tests/pluto/values.yaml --output-dir /pluto
docker run --rm -it -v pluto:/data us-docker.pkg.dev/fairwinds-ops/oss/pluto:v5 detect-files -d /data -o yaml --ignore-deprecations -t "k8s=v1.31.0,cert-manager=v1.17.0,istio=v1.24.0" -o wide
docker volume rm pluto
```

