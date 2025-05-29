# openlane-gcp-dns-zone

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

A Helm chart for gcp-dns-zone resource

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| computeAddresses | list | `[]` | List of compute addresses to create |
| dnsManagedZone | object | `{"dnsName":"tst1.poc.gcp.theopenlane.io.","name":"tst1-poc-gcp-openlane-com","privateVisibilityConfig":{"gkeClusters":[],"networks":[]},"visibility":"public"}` | DNS Managed zone configuration |
| dnsManagedZone.dnsName | string | `"tst1.poc.gcp.theopenlane.io."` | The name of DNS |
| dnsManagedZone.name | string | `"tst1-poc-gcp-openlane-com"` | The name of dnsManagedZone |
| dnsManagedZone.privateVisibilityConfig | object | `{"gkeClusters":[],"networks":[]}` | The configuration of private DNS zone |
| dnsManagedZone.visibility | string | `"public"` | The visibility of the DNS zone |
| dnsRecordSet | list | `[]` | DNS Records to create. Possible records: A, CNAME and NS |
| global.abandon | bool | `true` | Abandon resource if the manifests are deleted. Allow deleting a resource from config connector without deleting it from GCP |
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.description | string | `"The description of the dns-zone resource"` | Dns zone descriptions |
| global.forceDestroy | bool | `false` | Force the deletion of the objects created within the dns zone first, then deletes the dns-zone. |
| global.gcpProjectId | string | `"myprojectid"` | Project ID where to deploy the cluster |
| global.skipUnspecifiedFields | bool | `false` | This skips populating unspecified fields into the Kubernetes resource spec. |

## Installing the Chart

### With Helm

To install the chart with the release name `my-release`:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/openlane-gcp-dns-zone
```

### With ArgoCD

Add new application as:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: openlane-gcp-dns-zone
spec:
  project: infra

  source:
    repoURL: "https://theopenlane.github.io/openlane-infra"
    targetRevision: "0.1.0"
    chart: openlane-gcp-dns-zone
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-dns-zone --config /charts/charts/openlane-gcp-dns-zone/ct.yaml
```

### Run pluto

In order to check if the api-version used in this chart are not deprecated, or worse, removed, we use pluto to check it:

```
docker run --rm -it -v $(pwd):/apps -v pluto:/pluto alpine/helm:3.17 template openlane-gcp-dns-zone . -f tests/pluto/values.yaml --output-dir /pluto
docker run --rm -it -v pluto:/data us-docker.pkg.dev/fairwinds-ops/oss/pluto:v5 detect-files -d /data -o yaml --ignore-deprecations -t "k8s=v1.31.0,cert-manager=v1.17.0,istio=v1.24.0" -o wide
docker volume rm pluto
```

