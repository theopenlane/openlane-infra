![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

# openlane-gcp-cloudsql

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

A Helm chart that Creates a Google CloudSQL Instance via Config Connector

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| global.abandon | bool | `true` | If true, Keep the Compute Address even after the kcc resource deletion. |
| commonAppConfig | object | `{"cloudsql":{"cmekEnabled":false,"enabled":false,"instanceName":"default-sql","tier":"db-f1-micro","version":"POSTGRES_14"}}` | Placeholder for values to be overridden by bootrap |
| enabled | bool | `true` |  |
| name | string | `"openlane-postgresql-instance"` |  |
| region | string | `"us-central1"` |  |
| databaseVersion | string | `"POSTGRES_14"` |  |
| resourceID | string | `""` |  |
| deletionProtectionEnabled | bool | `true` |  |
| replicaConfiguration.connectRetryInterval | int | `60` |  |
| settings.tier | string | `"db-custom-2-7680"` |  |
| settings.availabilityType | string | `"ZONAL"` |  |
| settings.activationPolicy | string | `"ALWAYS"` |  |
| settings.diskSize | int | `10` |  |
| settings.diskType | string | `"PD_SSD"` |  |
| settings.diskAutoresize | bool | `true` |  |
| settings.diskAutoresizeLimit | int | `0` |  |
| settings.connectorEnforcement | string | `""` |  |
| settings.crashSafeReplication | bool | `false` |  |
| settings.dataCacheConfig.dataCacheEnabled | bool | `false` |  |
| settings.backupConfiguration.enabled | bool | `true` |  |
| settings.backupConfiguration.startTime | string | `"03:00"` |  |
| settings.backupConfiguration.location | string | `"us"` |  |
| settings.backupConfiguration.pointInTimeRecoveryEnabled | bool | `true` |  |
| settings.backupConfiguration.transactionLogRetentionDays | int | `7` |  |
| settings.backupConfiguration.binaryLogEnabled | bool | `false` |  |
| settings.backupConfiguration.backupRetentionSettings.retainedBackups | int | `7` |  |
| settings.backupConfiguration.backupRetentionSettings.retentionUnit | string | `"COUNT"` |  |
| settings.maintenanceWindow.day | int | `7` |  |
| settings.maintenanceWindow.hour | int | `3` |  |
| settings.maintenanceWindow.updateTrack | string | `"stable"` |  |
| settings.denyMaintenancePeriod.startDate | string | `""` |  |
| settings.denyMaintenancePeriod.endDate | string | `""` |  |
| settings.denyMaintenancePeriod.time | string | `""` |  |
| settings.collation | string | `""` |  |
| settings.edition | string | `""` |  |
| settings.insightsConfig.queryInsightsEnabled | bool | `false` |  |
| settings.insightsConfig.queryPlansPerMinute | int | `5` |  |
| settings.insightsConfig.queryStringLength | int | `1024` |  |
| settings.insightsConfig.recordApplicationTags | bool | `false` |  |
| settings.insightsConfig.recordClientAddress | bool | `false` |  |
| settings.ipConfiguration.allocatedIpRange | string | `""` |  |
| settings.ipConfiguration.ipv4Enabled | bool | `true` |  |
| settings.ipConfiguration.enablePrivatePathForGoogleCloudServices | bool | `false` |  |
| settings.ipConfiguration.privateNetworkRef.external | string | `""` |  |
| settings.ipConfiguration.authorizedNetworks[0].name | string | `""` |  |
| settings.ipConfiguration.authorizedNetworks[0].value | string | `""` |  |
| settings.ipConfiguration.authorizedNetworks[0].expirationTime | string | `""` |  |
| settings.databaseFlags | list | `[]` |  |
| settings.pricingPlan | string | `"PER_USE"` |  |
| settings.locationPreference.zone | string | `""` |  |
| settings.locationPreference.secondaryZone | string | `""` |  |
| settings.locationPreference.followGaeApplication | string | `""` |  |
| databases.enabled | bool | `true` |  |
| databases.items[0].name | string | `"mydb"` |  |
| databases.items[0].charset | string | `"UTF8"` |  |
| databases.items[0].collation | string | `"en_US.UTF8"` |  |
| users.enabled | bool | `true` |  |
| users.items[0].name | string | `"appuser"` |  |
| users.items[0].host | string | `"%"` |  |
| users.items[0].type | string | `"BUILT_IN"` |  |
| users.items[0].passwordSecretRef.secretRef.name | string | `"db-password-secret"` |  |
| users.items[0].passwordSecretRef.secretRef.key | string | `"password"` |  |

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
helm install openlane-infra/openlane-gcp-cloudsql
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-cloudsql --config /charts/charts/openlane-gcp-cloudsql/ct.yaml
```
