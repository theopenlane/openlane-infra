![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

# openlane-gcp-kcc

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

A Helm chart that manages a Config Connector GCP instance

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| global.abandon | bool | `true` | If true, Keep the Compute Address even after the kcc resource deletion. |
| name | string | `"openlane-config-controller"` |  |
| projectRef.external | string | `""` |  |
| projectRef.name | string | `""` |  |
| projectRef.namespace | string | `""` |  |
| location | string | `"us-central1"` |  |
| resourceID | string | `""` |  |
| usePrivateEndpoint | bool | `false` |  |
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-kcc --config /charts/charts/openlane-gcp-kcc/ct.yaml
```
