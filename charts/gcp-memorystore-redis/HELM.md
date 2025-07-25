# openlane-gcp-memorystore

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

A Helm chart that Creates a Google Memory Store (Redis instance) through Config Connector

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| global.abandon | bool | `true` | If true, Keep the resource even after the kcc resource deletion. |
| commonAppConfig.memorystore.enabled | bool | `false` |  |
| commonAppConfig.memorystore.instanceName | string | `"default-redis"` |  |
| commonAppConfig.memorystore.tier | string | `"BASIC"` |  |
| commonAppConfig.memorystore.memorySizeGb | int | `1` |  |
| enabled | bool | `true` |  |
| name | string | `"openlane-redis"` | Name of the Redis instance (metadata.name). |
| projectId | string | `""` | GCP project ID where the instance lives. |
| region | string | `"us-central1"` | Region for the Redis instance. |
| tier | string | `"BASIC"` | Service tier (BASIC or STANDARD_HA). |
| memorySizeGb | int | `1` | Memory size in GB. |
| displayName | string | `""` | Optional display name. |
| authNetworkRef | object | `{"external":""}` | Authorized network reference. |
| redisVersion | string | `"REDIS_6_X"` | Redis version (e.g., REDIS_6_X). |
| redisConfigs | object | `{}` | Map of custom Redis parameters. |

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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-memorystore --config /charts/charts/openlane-gcp-memorystore/ct.yaml
```
