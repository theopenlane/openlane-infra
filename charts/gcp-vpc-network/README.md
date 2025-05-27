# openlane-gcp-vpc-network

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

## Prerequisites

- Helm v3
- Config Connector installed (v1.6.0)

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> |  |

## Description

A Helm chart that Creates a Google VPC Network through Config Connector

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| annotations | object | `{}` | Add annotations to the VPC Network. |
| autoCreateSubnetworks | bool | `false` | Enable custom subnet creation. If false, the VPC Network will not create subnets. |
| deleteDefaultRoutesOnCreate | bool | `false` | Keep the default routes on creation by default. If true, the VPC Network will delete the default routes. |
| description | string | `"OPENLANE VPC Network for infrastructure."` | A text description of the VPC Network. Must be less than or equal to 256 UTF-8 bytes. |
| displayName | string | `"OPENLANE VPC"` | The display name for the VPC Network. Can be updated without creating a new resource. |
| enableUlaInternalIpv6 | bool | `false` | Enable ULA internal ipv6 on this network. |
| firewallRules.enabled | bool | `true` |  |
| firewallRules.rules[0] | object | `{"allowed":[{"protocol":"all"}],"description":"Allow all internal traffic within the VPC.","direction":"INGRESS","name":"allow-internal-all","priority":1000,"sourceRanges":["10.0.0.0/8"],"targetTags":[]}` | Allow internal communication within the VPC network (essential for GKE pod communication). |
| firewallRules.rules[1] | object | `{"allowed":[{"ports":["1-65535"],"protocol":"tcp"},{"ports":["1-65535"],"protocol":"udp"},{"protocol":"icmp"}],"description":"Allow GKE master ingress to nodes.","direction":"INGRESS","name":"allow-gke-master-ingress","priority":1000,"sourceRanges":["130.211.0.0/22","35.191.0.0/16"],"targetTags":["gke-{{ .Values.network.projectId }}-{{ include \"gcp-gke-prod-cluster.fullname\" . }}-node"]}` | Allow ingress from GKE masters to nodes (required by GKE). |
| firewallRules.rules[2] | object | `{"allowed":[{"ports":["80","443","8080"],"protocol":"tcp"}],"description":"Allow ingress for health checks from GCP Load Balancer.","direction":"INGRESS","name":"allow-health-check-ingress","priority":1000,"sourceRanges":["130.211.0.0/22","35.191.0.0/16"],"targetTags":[]}` | Allow ephemeral ports (for health checks from load balancer) |
| firewallRules.rules[3] | object | `{"allowed":[{"protocol":"all"}],"description":"Allow all egress traffic.","destinationRanges":["0.0.0.0/0"],"direction":"EGRESS","name":"allow-egress-all","priority":1000,"targetTags":[]}` | Default allow egress to all (securely restrict this where possible) |
| global.abandon | bool | `false` | Keep the VPC even after the kcc resource deletion. |
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| internalIpv6Range | string | `""` | Internal IPv6 range for ULA internal ipv6. |
| mtu | int | `1460` | Maximum Transmission Unit in bytes. |
| name | string | `"openlane-vpc"` | Name of the VPC Network. |
| networkFirewallPolicyEnforcementOrder | string | `"AFTER_CLASSIC_FIREWALL"` | The order that Firewall Rules and Firewall Policies are evaluated. Default value: "AFTER_CLASSIC_FIREWALL" Possible values: ["BEFORE_CLASSIC_FIREWALL", "AFTER_CLASSIC_FIREWALL"]. |
| resourceID | string | `""` | Optional resource ID. |
| routingMode | string | `"REGIONAL"` | Routing mode for the VPC Network. |
| sharedVPC | object | `{"host":{"enabled":false},"service":{"enabled":false,"hostNetworkRef":{"external":"openlane-network"},"hostProjectRef":{"external":""}}}` | Shared VPC configuration |
| sharedVPC.host | object | `{"enabled":false}` | Enable this project as a Shared VPC Host. |
| sharedVPC.service | object | `{"enabled":false,"hostNetworkRef":{"external":"openlane-network"},"hostProjectRef":{"external":""}}` | Enable this project as a Shared VPC Service. |
| sharedVPC.service.hostNetworkRef | object | `{"external":"openlane-network"}` | The reference to the host network in the Shared VPC Host project. |
| sharedVPC.service.hostProjectRef | object | `{"external":""}` | The reference to the host project. |

## Installing the Chart

### With Helm

To install the chart with the release name `my-release`:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/openlane-gcp-vpc-network
```

### With ArgoCD

Add new application as:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: openlane-gcp-vpc-network
spec:
  project: infra

  source:
    repoURL: "https://theopenlane.github.io/openlane-infra"
    targetRevision: "0.1.0"
    chart: openlane-gcp-vpc-network
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-vpc-network --config /charts/charts/openlane-gcp-vpc-network/ct.yaml
```

### Run pluto

In order to check if the api-version used in this chart are not deprecated, or worse, removed, we use pluto to check it:

```
docker run --rm -it -v $(pwd):/apps -v pluto:/pluto alpine/helm:3.17 template openlane-gcp-vpc-network . -f tests/pluto/values.yaml --output-dir /pluto
docker run --rm -it -v pluto:/data us-docker.pkg.dev/fairwinds-ops/oss/pluto:v5 detect-files -d /data -o yaml --ignore-deprecations -t "k8s=v1.31.0,cert-manager=v1.17.0,istio=v1.24.0" -o wide
docker volume rm pluto
```

