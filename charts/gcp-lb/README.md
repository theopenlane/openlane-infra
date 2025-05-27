# openlane-gcp-lb

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

## Prerequisites

- Helm v3
- Config Connector installed (v1.6.0)

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> |  |

## Description

A Helm chart that Creates Loadbalancing resources via Config Connector

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| backendService.backends[0].balancingMode | string | `"UTILIZATION"` |  |
| backendService.backends[0].capacityScaler | float | `1` |  |
| backendService.backends[0].group.external | string | `""` |  |
| backendService.backends[0].maxUtilization | float | `0.8` |  |
| backendService.enableCDN | bool | `false` |  |
| backendService.enabled | bool | `true` |  |
| backendService.healthCheck | string | `""` |  |
| backendService.name | string | `"openlane-backend-service"` |  |
| backendService.ports | list | `[]` |  |
| backendService.protocol | string | `"HTTP"` |  |
| backendService.sessionAffinity | string | `"NONE"` |  |
| forwardingRuleHttp.IPProtocol | string | `"TCP"` |  |
| forwardingRuleHttp.enabled | bool | `true` |  |
| forwardingRuleHttp.name | string | `"openlane-fr-http"` |  |
| forwardingRuleHttp.portRange | string | `"80-80"` |  |
| forwardingRuleHttp.target | string | `""` |  |
| forwardingRuleHttps.IPProtocol | string | `"TCP"` |  |
| forwardingRuleHttps.enabled | bool | `true` |  |
| forwardingRuleHttps.name | string | `"openlane-fr-https"` |  |
| forwardingRuleHttps.portRange | string | `"443-443"` |  |
| forwardingRuleHttps.target | string | `""` |  |
| global.abandon | bool | `true` | If true, Keep the resources even after the kcc resource deletion. |
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| globalAddress.addressType | string | `"EXTERNAL"` |  |
| globalAddress.description | string | `""` |  |
| globalAddress.enabled | bool | `true` |  |
| globalAddress.ipVersion | string | `"IPV4"` |  |
| globalAddress.name | string | `"openlane-lb-address"` |  |
| globalAddress.networkRef.external | string | `""` |  |
| globalAddress.networkTier | string | `"PREMIUM"` |  |
| globalAddress.prefixLength | int | `0` |  |
| globalAddress.projectId | string | `""` |  |
| globalAddress.purpose | string | `""` |  |
| globalAddress.subnetworkRef.external | string | `""` |  |
| healthCheck.checkIntervalSec | int | `10` |  |
| healthCheck.enabled | bool | `true` |  |
| healthCheck.healthyThreshold | int | `2` |  |
| healthCheck.httpHealthCheck.port | int | `80` |  |
| healthCheck.httpHealthCheck.requestPath | string | `"/healthz"` |  |
| healthCheck.name | string | `"openlane-hc"` |  |
| healthCheck.tcpHealthCheck | object | `{}` |  |
| healthCheck.timeoutSec | int | `5` |  |
| healthCheck.unhealthyThreshold | int | `2` |  |
| managedSslCertificate.description | string | `""` |  |
| managedSslCertificate.domains[0] | string | `"example.com"` |  |
| managedSslCertificate.domains[1] | string | `"www.example.com"` |  |
| managedSslCertificate.enabled | bool | `true` |  |
| managedSslCertificate.name | string | `"openlane-ssl-cert"` |  |
| sslPolicy.customFeatures | list | `[]` |  |
| sslPolicy.enabled | bool | `true` |  |
| sslPolicy.minTlsVersion | string | `"TLS_1_3"` |  |
| sslPolicy.name | string | `"openlane-ssl-policy"` |  |
| sslPolicy.profile | string | `"MODERN"` |  |
| targetHttpProxy.enabled | bool | `true` |  |
| targetHttpProxy.name | string | `"openlane-http-proxy"` |  |
| targetHttpProxy.urlMap | string | `""` |  |
| targetHttpsProxy.enabled | bool | `true` |  |
| targetHttpsProxy.name | string | `"openlane-https-proxy"` |  |
| targetHttpsProxy.sslCertificates | list | `[]` |  |
| targetHttpsProxy.urlMap | string | `"openlane-url-map"` |  |
| urlMap.defaultService | string | `""` |  |
| urlMap.enabled | bool | `true` |  |
| urlMap.hostRules[0].hosts[0] | string | `"example.com"` |  |
| urlMap.hostRules[0].pathMatcher | string | `"default"` |  |
| urlMap.name | string | `"openlane-url-map"` |  |

## Installing the Chart

### With Helm

To install the chart with the release name `my-release`:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/openlane-gcp-lb
```

### With ArgoCD

Add new application as:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: openlane-gcp-lb
spec:
  project: infra

  source:
    repoURL: "https://theopenlane.github.io/openlane-infra"
    targetRevision: "0.1.0"
    chart: openlane-gcp-lb
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-lb --config /charts/charts/openlane-gcp-lb/ct.yaml
```

### Run pluto

In order to check if the api-version used in this chart are not deprecated, or worse, removed, we use pluto to check it:

```
docker run --rm -it -v $(pwd):/apps -v pluto:/pluto alpine/helm:3.17 template openlane-gcp-lb . -f tests/pluto/values.yaml --output-dir /pluto
docker run --rm -it -v pluto:/data us-docker.pkg.dev/fairwinds-ops/oss/pluto:v5 detect-files -d /data -o yaml --ignore-deprecations -t "k8s=v1.31.0,cert-manager=v1.17.0,istio=v1.24.0" -o wide
docker volume rm pluto
```

