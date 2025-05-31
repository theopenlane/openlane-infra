![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

# openlane-gcp-cloud-nat

**Homepage:** <https://www.theopenlane.io>

## Prerequisites

- [Helm](https://helm.sh/docs/intro/install/)
- [ct](https://github.com/helm/chart-testing)
- [helm-docs](https://github.com/norwoodj/helm-docs)
- [task](https://taskfile.dev/)

Once you've installed `task` you can simply run `task install` to get the remaining dependencies installed, assuning you're using macOS and have `brew`.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://theopenlane.github.io/openlane-infra | gcpCloudRouter(openlane-gcp-compute-router) | 0.1.1 |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

A Helm chart to provision a Cloud NAT (ComputeRouterNAT) via Config Connector

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.abandon | bool | `true` | Abandon resource if the manifests are deleted. Allow deleting a resource from config connector without deleting it from GCP |
| global.skipUnspecifiedFields | bool | `false` | This skips populating unspecified fields into the Kubernetes resource spec. |
| global.gcpProjectId | string | `"myprojectid"` | Project ID where to deploy the cluster |
| global.description | string | `""` | subNetwork description (use helm tpl) |
| annotations | object | `{}` | Add annotations to the Cloud NAT. |
| name | string | `"openlane-cloud-nat"` | Name of the Compute Router. |
| description | string | `"Cloud NAT configuration for Google Compute Router"` | A text description of the Cloud NAT. Must be less than or equal to 256 UTF-8 bytes. |
| drainNatIps | list | `[]` | A list of IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT. |
| enableDynamicPortAllocation | bool | `false` | Enable Dynamic Port Allocation. If minPortsPerVm is set, minPortsPerVm must be set to a power of two greater than or equal to 32. If minPortsPerVm is not set, a minimum of 32 ports will be allocated to a VM from this NAT config. If maxPortsPerVm is set, maxPortsPerVm must be set to a power of two greater than minPortsPerVm. If maxPortsPerVm is not set, a maximum of 65536 ports will be allocated to a VM from this NAT config. Mutually exclusive with enableEndpointIndependentMapping. |
| enableEndpointIndependentMapping | bool | `true` | Specifies if endpoint independent mapping is enabled. This is enabled by default. For more information see the [official documentation](https://cloud.google.com/nat/docs/overview#specs-rfcs). |
| icmpIdleTimeoutSec | int | `30` | Timeout (in seconds) for ICMP connections. Defaults to 30s if not set. |
| logConfig | object | `{"enable":false,"filter":"ALL"}` | Configuration for logging on NAT. |
| logConfig.enable | bool | `false` | Indicates whether or not to export logs. |
| logConfig.filter | string | `"ALL"` | Specifies the desired filtering of logs on this NAT. Possible values: ["ERRORS_ONLY", "TRANSLATIONS_ONLY", "ALL"]. |
| maxPortsPerVm | int | `0` | Maximum number of ports allocated to a VM from this NAT. This field can only be set when enableDynamicPortAllocation is enabled. |
| minPortsPerVm | int | `0` | Minimum number of ports allocated to a VM from this NAT. |
| natIpAllocateOption | string | `"AUTO_ONLY"` | How external IPs should be allocated for this NAT. Valid values are 'AUTO_ONLY' for only allowing NAT IPs allocated by Google Cloud Platform, or 'MANUAL_ONLY' for only user-allocated NAT IP addresses. Possible values: ["MANUAL_ONLY", "AUTO_ONLY"]. |
| natIps | list | `[]` | NAT IPs. Only valid if natIpAllocateOption is set to MANUAL_ONLY. |
| region | string | `"us-central1"` | Immutable. Region where the router and NAT reside. |
| resourceID | string | `""` | Immutable. Optional. The name of the resource. Used for creation and acquisition. When unset, the value of `metadata.name` is used as the default. |
| routerRef | object | `{"external":"","name":"openlane-router","namespace":""}` | The Cloud Router in which this NAT will be configured. |
| routerRef.external | string | `""` | Allowed value: The `name` field of a `ComputeRouter` resource. |
| routerRef.name | string | `"openlane-router"` | Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names |
| routerRef.namespace | string | `""` | Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/ |
| rules | list | `[]` | A list of rules associated with this NAT. |
| sourceSubnetworkIpRangesToNat | string | `"ALL_SUBNETWORKS_ALL_IP_RANGES"` | How NAT should be configured per Subnetwork. If 'ALL_SUBNETWORKS_ALL_IP_RANGES', all of the IP ranges in every Subnetwork are allowed to Nat. If 'ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES', all of the primary IP ranges in every Subnetwork are allowed to Nat. 'LIST_OF_SUBNETWORKS': A list of Subnetworks are allowed to Nat (specified in the field subnetwork below). Note that if this field contains ALL_SUBNETWORKS_ALL_IP_RANGES or ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, then there should not be any other RouterNat section in any Router for this network in this region. Possible values: ["ALL_SUBNETWORKS_ALL_IP_RANGES", "ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES", "LIST_OF_SUBNETWORKS"]. |
| subnetwork | list | `[]` | One or more subnetwork NAT configurations. Only used if 'source_subnetwork_ip_ranges_to_nat' is set to 'LIST_OF_SUBNETWORKS'. |
| tcpEstablishedIdleTimeoutSec | int | `1200` | Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set. |
| tcpTimeWaitTimeoutSec | int | `120` | Timeout (in seconds) for TCP connections that are in TIME_WAIT state. Defaults to 120s if not set. |
| tcpTransitoryIdleTimeoutSec | int | `30` | Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set. |
| udpIdleTimeoutSec | int | `30` | Timeout (in seconds) for UDP connections. Defaults to 30s if not set. |

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
helm install openlane-infra/openlane-gcp-cloud-nat
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-cloud-nat --config /charts/charts/openlane-gcp-cloud-nat/ct.yaml
```
