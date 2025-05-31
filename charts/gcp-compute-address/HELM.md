![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

# openlane-gcp-compute-address

**Homepage:** <https://www.theopenlane.io>

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

A Helm chart to provision a Compute Address via Config Connector

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| global.abandon | bool | `true` | If true, Keep the Compute Address even after the kcc resource deletion. |
| annotations | object | `{}` | Add annotations to the Compute Address. |
| name | string | `"gcp-static-ip"` | Name of Compute Address |
| address | string | `""` | Optional: The static external IP address represented by this resource.    Must be inside the specified subnetwork if defined. |
| addressType | string | `"EXTERNAL"` | The type of address to reserve.    Valid options: "INTERNAL" or "EXTERNAL". Default: "EXTERNAL". |
| description | string | `"Compute Address configuration for Google Compute Router"` | A text description of the Compute Address.    Must be less than or equal to 256 UTF-8 bytes. |
| ipVersion | string | `"IPV4"` | The IP Version that will be used by this address.    Valid options: "IPV4", "IPV6". Default: "IPV4". |
| ipv6EndpointType | string | `""` | The endpoint type for an IPv6 address.    Valid options: "VM", "NETLB". |
| location | string | `"us-central1"` | The geographical location for the Compute Address.    Specify a region (e.g., "us-central1") or "global" for global resources. |
| networkTier | string | `"STANDARD"` | The networking tier used for configuring this address.    Valid options: "PREMIUM", "STANDARD".    Should not be used with INTERNAL addresses. |
| prefixLength | string | `nil` | The prefix length if the resource represents an IP range. |
| purpose | string | `nil` | The purpose of this resource.    Valid options include:      "GCE_ENDPOINT", "SHARED_LOADBALANCER_VIP", "VPC_PEERING",      "IPSEC_INTERCONNECT", "PRIVATE_SERVICE_CONNECT" |
| networkRef | object | `{"external":"","name":"openlane-vpc","namespace":""}` | Optional: Network reference configuration.    Only applicable for INTERNAL addresses with VPC_PEERING or IPSEC_INTERCONNECT purposes. |
| networkRef.external | string | `""` | The selfLink of the ComputeNetwork resource. |
| networkRef.name | string | `"openlane-vpc"` | The name of the referent. |
| networkRef.namespace | string | `""` | The namespace of the referent. |
| subnetworkRef | object | `{"external":"","name":"openlane-subnetwork","namespace":""}` | Optional: Subnetwork reference configuration.    Only applicable for INTERNAL addresses with GCE_ENDPOINT/DNS_RESOLVER purposes. |
| subnetworkRef.external | string | `""` | The selfLink of the ComputeSubnetwork resource. |
| subnetworkRef.name | string | `"openlane-subnetwork"` | The name of the referent. |
| subnetworkRef.namespace | string | `""` | The namespace of the referent. |

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
helm install openlane-infra/openlane-gcp-compute-address
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-compute-address --config /charts/charts/openlane-gcp-compute-address/ct.yaml
```
