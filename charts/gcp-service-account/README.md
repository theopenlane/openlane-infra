# openlane-gcp-service-account

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

**Homepage:** <https://www.theopenlane.io>

## Prerequisites

- Helm v3
- Config Connector installed (v1.6.0)

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> |  |

## Description

A Helm chart that Creates a Google Service Account and it's Key through Config Connector

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| annotations | object | `{}` | Add annotations to the resources |
| description | string | `"Read the Bucket toto"` | A text description of the service account. Must be less than or equal to 256 UTF-8 bytes. |
| displayName | string | `"My SA"` | The display name for the service account. Can be updated without creating a new resource. |
| global.abandon | bool | `false` | Keep the GSA even after the kcc resource deletion |
| global.cnrmNamespace | string | `nil | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| key.create | bool | `false` |  |
| key.importAsSecret | bool | `false` |  |
| name | string | `"mysa"` | Name of the service account. Will be used for the sa email creation. |

## Installing the Chart

### With Helm

To install the chart with the release name `my-release`:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/openlane-gcp-service-account
```

### With ArgoCD

Add new application as:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: openlane-gcp-service-account
spec:
  project: infra

  source:
    repoURL: "https://theopenlane.github.io/openlane-infra"
    targetRevision: "0.1.0"
    chart: openlane-gcp-service-account
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-service-account --config /charts/charts/openlane-gcp-service-account/ct.yaml
```

### Run pluto

In order to check if the api-version used in this chart are not deprecated, or worse, removed, we use pluto to check it:

```
docker run --rm -it -v $(pwd):/apps -v pluto:/pluto alpine/helm:3.17 template openlane-gcp-service-account . -f tests/pluto/values.yaml --output-dir /pluto
docker run --rm -it -v pluto:/data us-docker.pkg.dev/fairwinds-ops/oss/pluto:v5 detect-files -d /data -o yaml --ignore-deprecations -t "k8s=v1.31.0,cert-manager=v1.17.0,istio=v1.24.0" -o wide
docker volume rm pluto
```

