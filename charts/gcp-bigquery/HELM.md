# openlane-gcp-bigquery

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

A Helm chart that Creates BigQuery resources through Config Connector

## Source Code

* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| global.deletion_policy | string | `"abandon"` | Keep the VPC even after the kcc resource deletion. |
| bigqueryDataset.delete_contents_on_destroy | string | `"false"` |  |
| bigqueryDataset.name | string | `"openlane-bigquery"` | name of the Dataset |
| bigqueryDataset.namespace | string | `"cnrm-gcp-dev"` |  |
| bigqueryDataset.access[0].dataset | object | `{}` |  |
| bigqueryDataset.access[0].domain | string | `""` |  |
| bigqueryDataset.access[0].groupByEmail | string | `""` |  |
| bigqueryDataset.access[0].role | string | `""` | roles list for roles writer/reader/admin |
| bigqueryDataset.access[0].routine | object | `{}` |  |
| bigqueryDataset.access[0].specialGroup | string | `""` |  |
| bigqueryDataset.access[0].userByEmail | string | `""` | email id for the gke serviceaccount |
| bigqueryDataset.access[0].view | object | `{}` |  |
| bigqueryDataset.defaultCollation | string | `""` |  |
| bigqueryDataset.defaultEncryptionConfiguration | object | `{}` |  |
| bigqueryDataset.defaultPartitionExpirationMs | string | `""` |  |
| bigqueryDataset.defaultTableExpirationMs | string | `""` |  |
| bigqueryDataset.description | string | `""` | user defines definition |
| bigqueryDataset.friendlyName | string | `""` | friendly definition |
| bigqueryDataset.isCaseInsensitive | string | `""` |  |
| bigqueryDataset.location | string | `""` | location of the dataset |
| bigqueryDataset.maxTimeTravelHours | string | `""` |  |
| bigqueryDataset.projectRef | object | `{}` |  |
| bigqueryDataset.resourceID | string | `""` |  |
| bigqueryDataset.storageBillingModel | string | `""` |  |

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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-bigquery --config /charts/charts/openlane-gcp-bigquery/ct.yaml
```
