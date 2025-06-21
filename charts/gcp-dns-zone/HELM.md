![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

# openlane-gcp-dns-zone

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

A Helm chart for gcp-dns-zone resource

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.abandon | bool | `true` | Abandon resource if the manifests are deleted. Allow deleting a resource from config connector without deleting it from GCP |
| global.forceDestroy | bool | `false` | Force the deletion of the objects created within the dns zone first, then deletes the dns-zone. |
| global.skipUnspecifiedFields | bool | `false` | This skips populating unspecified fields into the Kubernetes resource spec. |
| global.description | string | `"The description of the dns-zone resource"` | Dns zone descriptions |
| global.gcpProjectId | string | `"myprojectid"` | Project ID where to deploy the cluster |
| commonAppConfig.enabled | bool | `false` |  |
| commonAppConfig.name | string | `"default-zone"` |  |
| commonAppConfig.domainName | string | `"default.com."` |  |
| dnsManagedZone | object | `{"dnsName":"tst1.poc.gcp.theopenlane.io.","name":"tst1-poc-gcp-openlane-com","privateVisibilityConfig":{"gkeClusters":[],"networks":[]},"visibility":"public"}` | DNS Managed zone configuration |
| dnsManagedZone.name | string | `"tst1-poc-gcp-openlane-com"` | The name of dnsManagedZone |
| dnsManagedZone.dnsName | string | `"tst1.poc.gcp.theopenlane.io."` | The name of DNS |
| dnsManagedZone.visibility | string | `"public"` | The visibility of the DNS zone |
| dnsManagedZone.privateVisibilityConfig | object | `{"gkeClusters":[],"networks":[]}` | The configuration of private DNS zone |
| dnsRecordSet | list | `[]` | DNS Records to create. Possible records: A, CNAME and NS |
| computeAddresses | list | `[]` | List of compute addresses to create |

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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-dns-zone --config /charts/charts/openlane-gcp-dns-zone/ct.yaml
```
