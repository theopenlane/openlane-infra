**Conceptual `charts/gcp-vpc/templates/` changes:**
*   `network.yaml`: Defines `ComputeNetwork` CR (`compute.cnrm.cloud.google.com/v1beta1.ComputeNetwork`). `projectRef.external` points to `values.network.projectId`.
*   `subnets.yaml`: Iterates `values.subnetworks` to create `ComputeSubnetwork` CRs (`compute.cnrm.cloud.google.com/v1beta1.ComputeSubnetwork`), referencing `networkRef.external` (to the network name) and `projectRef.external` (for the network's project).
*   `firewall.yaml`: Iterates `values.firewallRules` to create `ComputeFirewall` CRs (`compute.cnrm.cloud.google.com/v1beta1.ComputeFirewall`), referencing `networkRef.external`.
*   `shared-vpc-host.yaml`: If `values.sharedVPC.host.enabled` is `true`, creates a `ComputeSharedVPCHostProject` CR (`compute.cnrm.cloud.google.com/v1beta1.ComputeSharedVPCHostProject`), referencing the `projectRef.external` (current project).
*   `shared-vpc-service.yaml`: If `values.sharedVPC.service.enabled` is `true`, creates a `ComputeSharedVPCServiceProject` CR (`compute.cnrm.cloud.google.com/v1beta1.ComputeSharedVPCServiceProject`), referencing `hostProjectRef.external` and `hostNetworkRef.external`.

# GCP VPC Network Helm Chart (CNRM)

This Helm chart provisions a Virtual Private Cloud (VPC) network, subnets, and essential firewall rules in GCP using **GCP Config Connector**.

**Key Features:**

*   **Shared VPC Support:** Configure the network as a Shared VPC Host project or attach it as a Shared VPC Service project.
*   **VPC-native Networking:** Defaults to VPC-native GKE clusters.
*   **Secure Firewall Rules:** Essential firewall rules for GKE cluster operation and internal communication.

## Usage

This chart is typically deployed early in the infrastructure provisioning process as other resources (GKE, CloudSQL, Redis) depend on it.

## Shared VPC Configuration

This chart can operate in two modes for Shared VPC:

1.  **Host Project Mode:**
    *   Set `sharedVPC.host.enabled: true`.
    *   The chart will create the network and enable it as a Shared VPC Host using `ComputeSharedVPCHostProject`.
    *   You'll define the service projects that are allowed to attach to this host (usually done using `ComputeSharedVPCServiceProject` in the service project).
2.  **Service Project Mode:**
    *   Set `sharedVPC.service.enabled: true`.
    *   Specify the `hostNetworkRef` for the network in the Shared VPC Host project, and its `hostProjectRef`.
    *   The chart will create a `ComputeSharedVPCServiceProject` resource, attaching this project to the host.

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
| global.abandon | bool | `false` | Keep the VPC even after the kcc resource deletion. |
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| internalIpv6Range | string | `""` | Internal IPv6 range for ULA internal ipv6. |
| mtu | int | `1460` | Maximum Transmission Unit in bytes. |
| name | string | `"openlane-vpc"` | Name of the VPC Network. |
| networkFirewallPolicyEnforcementOrder | string | `"AFTER_CLASSIC_FIREWALL"` | The order that Firewall Rules and Firewall Policies are evaluated. Default value: "AFTER_CLASSIC_FIREWALL" Possible values: ["BEFORE_CLASSIC_FIREWALL", "AFTER_CLASSIC_FIREWALL"]. |
| resourceID | string | `""` | Optional resource ID. |
| routingMode | string | `"REGIONAL"` | Routing mode for the VPC Network. |

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

