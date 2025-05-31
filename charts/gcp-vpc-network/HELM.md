![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

# openlane-gcp-vpc-network

## Prerequisites

- [Helm](https://helm.sh/docs/intro/install/)
- [ct](https://github.com/helm/chart-testing)
- [helm-docs](https://github.com/norwoodj/helm-docs)
- [task](https://taskfile.dev/)

Once you've installed `task` you can simply run `task install` to get the remaining dependencies installed, assuning you're using macOS and have `brew`.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

A Helm chart that Creates a Google VPC Network through Config Connector

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| global.abandon | bool | `false` | Keep the VPC even after the kcc resource deletion. |
| name | string | `"openlane-vpc"` | Name of the VPC Network. |
| displayName | string | `"OPENLANE VPC"` | The display name for the VPC Network. Can be updated without creating a new resource. |
| description | string | `"OPENLANE VPC Network for infrastructure."` | A text description of the VPC Network. Must be less than or equal to 256 UTF-8 bytes. |
| autoCreateSubnetworks | bool | `false` | Enable custom subnet creation. If false, the VPC Network will not create subnets. |
| deleteDefaultRoutesOnCreate | bool | `false` | Keep the default routes on creation by default. If true, the VPC Network will delete the default routes. |
| mtu | int | `1460` | Maximum Transmission Unit in bytes. |
| routingMode | string | `"REGIONAL"` | Routing mode for the VPC Network. |
| enableUlaInternalIpv6 | bool | `false` | Enable ULA internal ipv6 on this network. |
| internalIpv6Range | string | `""` | Internal IPv6 range for ULA internal ipv6. |
| networkFirewallPolicyEnforcementOrder | string | `"AFTER_CLASSIC_FIREWALL"` | The order that Firewall Rules and Firewall Policies are evaluated. Default value: "AFTER_CLASSIC_FIREWALL" Possible values: ["BEFORE_CLASSIC_FIREWALL", "AFTER_CLASSIC_FIREWALL"]. |
| resourceID | string | `""` | Optional resource ID. |
| annotations | object | `{}` | Add annotations to the VPC Network. |
| firewallRules.enabled | bool | `true` |  |
| firewallRules.rules[0] | object | `{"allowed":[{"protocol":"all"}],"description":"Allow all internal traffic within the VPC.","direction":"INGRESS","name":"allow-internal-all","priority":1000,"sourceRanges":["10.0.0.0/8"],"targetTags":[]}` | Allow internal communication within the VPC network (essential for GKE pod communication). |
| firewallRules.rules[1] | object | `{"allowed":[{"ports":["1-65535"],"protocol":"tcp"},{"ports":["1-65535"],"protocol":"udp"},{"protocol":"icmp"}],"description":"Allow GKE master ingress to nodes.","direction":"INGRESS","name":"allow-gke-master-ingress","priority":1000,"sourceRanges":["130.211.0.0/22","35.191.0.0/16"],"targetTags":["gke-{{ .Values.network.projectId }}-{{ include \"gcp-gke-prod-cluster.fullname\" . }}-node"]}` | Allow ingress from GKE masters to nodes (required by GKE). |
| firewallRules.rules[2] | object | `{"allowed":[{"ports":["80","443","8080"],"protocol":"tcp"}],"description":"Allow ingress for health checks from GCP Load Balancer.","direction":"INGRESS","name":"allow-health-check-ingress","priority":1000,"sourceRanges":["130.211.0.0/22","35.191.0.0/16"],"targetTags":[]}` | Allow ephemeral ports (for health checks from load balancer) |
| firewallRules.rules[3] | object | `{"allowed":[{"protocol":"all"}],"description":"Allow all egress traffic.","destinationRanges":["0.0.0.0/0"],"direction":"EGRESS","name":"allow-egress-all","priority":1000,"targetTags":[]}` | Default allow egress to all (securely restrict this where possible) |
| sharedVPC | object | `{"host":{"enabled":false},"service":{"enabled":false,"hostNetworkRef":{"external":"openlane-network"},"hostProjectRef":{"external":""}}}` | Shared VPC configuration |
| sharedVPC.host | object | `{"enabled":false}` | Enable this project as a Shared VPC Host. |
| sharedVPC.service | object | `{"enabled":false,"hostNetworkRef":{"external":"openlane-network"},"hostProjectRef":{"external":""}}` | Enable this project as a Shared VPC Service. |
| sharedVPC.service.hostProjectRef | object | `{"external":""}` | The reference to the host project. |
| sharedVPC.service.hostNetworkRef | object | `{"external":"openlane-network"}` | The reference to the host network in the Shared VPC Host project. |

## Config Connector resources

This chart is either based on GCP config connector resources, or assumes it will be consumed by Config Connector. All KCC (Kubernetes Config Connector) CRDs are available on [gcp documentation](https://cloud.google.com/config-connector/docs/reference/overview).

## Installing the Chart

The charts in this repo are not generally intended to be installed directly with Helm - they are structured such that the `gcp-bootstrap` chart templates out Argo applications and helm values overrides that cascade down into the individual charts. While you can install them directly, be certain to note that most charts are structured to have their default values file, and then values which drive most of the actual config that are stubbed out in the `values.yaml` like so:

```yaml
projectId: "default-project"
projectNumericalId: "123456789012"
gcpProjectName: "Default Project"
k8sNamespace: "default-ns"
orgId: "ORG_ID_DEFAULT"
billingAccountId: "BILLING_ID_DEFAULT"
primaryRegion: "us-east4"
envName: "default"
envCapitalizedName: "Default"
kms: {} # Passed for CMEK reference
commonAppConfig:
  [SUBCHART_NAME]:
```

Under the `commonAppConfig` key, you will find the subchart name, which is the name of the chart you are installing. This is where you can override the default values for that chart typically. For more information, check out the README.md in the root of the openlane-infra repository.

### via Hellm

This chart is available in the [openlane-infra helm repository](https://theopenlane.github.io/openlane-infra).

To add the chart and install the chart with with helm default values, run the following command:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/openlane-gcp-vpc-network
```

## Update documentation

Each of the charts in this repository has a `README.md` which contains chart-specific instructions or information (non-templated information) and additionally a `HELM.md`. This allows all the benefits of templating to be used in the `HELM.md` while still allowing for chart-specific documentation to be added and not be overridden. The general goal is that all the charts share the same templating configuration so that global functionality / updates can be made and applied to all charts rather than individually managing each chart's documentation via the templating mechanisms.

Chart documentation in the `HELM.md` is generated with [helm-docs](https://github.com/norwoodj/helm-docs) from `values.yaml` file.

After file modification, regenerate README.md with command:

```bash
task docs
```

OR if you want to attempt to run it without task, you can use optionally use the docker image although there is no stock Task provided for this:

```bash
docker run --rm -it -v $(pwd):/helm --workdir /helm jnorwood/helm-docs:v1.14.2 helm-docs
```

Globally updating all charts' documentation can be done by running the following command from the root of the repository:

```bash
task docs
```

## Run linter

To run the linter on this chart, you can use the `ct` tool. This will check for common issues in the chart and ensure it adheres to best practices. You can also run Helm's `lint` and for convenience, the task command below runs both `ct lint` and `helm lint` commands. You can run them individually if you prefer via `task lint:ct` and `task lint:helm`.

You can run both linters with the following command:

```bash
task lint
```

OR if you'd like to run the ct lint process by using a docker image, you can use a command like the following:

```bash
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-vpc-network --config /charts/charts/openlane-gcp-vpc-network/ct.yaml
```
