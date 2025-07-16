# openlane-gcp-subnetwork

**Homepage:** <https://docs.theopenlane.io>

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

Chart for compute-subnetwork resource with config connector

## Source Code

* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.abandon | bool | `true` | Abandon resource if the manifests are deleted. Allow deleting a resource from config connector without deleting it from GCP |
| global.skipUnspecifiedFields | bool | `false` | This skips populating unspecified fields into the Kubernetes resource spec. |
| global.gcpProjectId | string | `"myprojectid"` | Project ID where to deploy the cluster |
| global.description | string | `""` | subNetwork description (use helm tpl) |
| name | string | `"openlane-subnetwork"` | The name of the resource. |
| ipCidrRange | string | `"10.0.0.0/22"` | The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported. |
| ipv6AccessType | string | `""` | The access type of IPv6 address this subnet holds. Possible values: ["EXTERNAL", "INTERNAL"]. |
| networkRef | object | `{"external":"","name":"openlane-vpc","namespace":""}` | The network this subnet belongs to. Only networks that are in the distributed mode can have subnetworks. |
| privateIpGoogleAccess | string | `"true"` | When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access. |
| privateIpv6GoogleAccess | string | `nil` | The private IPv6 google access type for the VMs in this subnet. |
| purpose | string | `"PRIVATE"` | The purpose of the resource.  This field can be either 'PRIVATE_RFC_1918', 'REGIONAL_MANAGED_PROXY', 'GLOBAL_MANAGED_PROXY', or 'PRIVATE_SERVICE_CONNECT'. |
| region | string | `"us-central1"` | The GCP region for this subnetwork. |
| resourceID | string | `nil` | The name of the resource. Used for creation and acquisition. When unset, the value of `metadata.name` is used as the default. |
| role | string | `"ACTIVE"` |  |
| secondaryIpRange | list | `[{"ipCidrRange":"10.0.4.0/22","rangeName":"pods"},{"ipCidrRange":"10.0.8.0/22","rangeName":"services"}]` | The secondary range of the subnetwork. |
| stackType | string | `""` | The stack type for this subnet to identify whether the IPv6 feature is enabled or not. Possible values: ["IPV4_ONLY", "IPV4_IPV6"]. |

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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-subnetwork --config /charts/charts/openlane-gcp-subnetwork/ct.yaml
```
