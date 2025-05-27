# openlane-gcp-cloudsql

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

## Prerequisites

- Helm v3
- Config Connector installed (v1.6.0)

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> |  |

## Description

A Helm chart that Creates a Google CloudSQL Instance via Config Connector

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| databaseVersion | string | `"POSTGRES_14"` |  |
| databases.enabled | bool | `true` |  |
| databases.items[0].charset | string | `"UTF8"` |  |
| databases.items[0].collation | string | `"en_US.UTF8"` |  |
| databases.items[0].name | string | `"mydb"` |  |
| deletionProtectionEnabled | bool | `true` |  |
| enabled | bool | `true` |  |
| global.abandon | bool | `true` | If true, Keep the Compute Address even after the kcc resource deletion. |
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.gcpProjectId | string | `"myprojectid"` | Google Project ID |
| name | string | `"openlane-postgresql-instance"` |  |
| region | string | `"us-central1"` |  |
| replicaConfiguration.connectRetryInterval | int | `60` |  |
| resourceID | string | `""` |  |
| settings.activationPolicy | string | `"ALWAYS"` |  |
| settings.availabilityType | string | `"ZONAL"` |  |
| settings.backupConfiguration.backupRetentionSettings.retainedBackups | int | `7` |  |
| settings.backupConfiguration.backupRetentionSettings.retentionUnit | string | `"COUNT"` |  |
| settings.backupConfiguration.binaryLogEnabled | bool | `false` |  |
| settings.backupConfiguration.enabled | bool | `true` |  |
| settings.backupConfiguration.location | string | `"us"` |  |
| settings.backupConfiguration.pointInTimeRecoveryEnabled | bool | `true` |  |
| settings.backupConfiguration.startTime | string | `"03:00"` |  |
| settings.backupConfiguration.transactionLogRetentionDays | int | `7` |  |
| settings.collation | string | `""` |  |
| settings.connectorEnforcement | string | `""` |  |
| settings.crashSafeReplication | bool | `false` |  |
| settings.dataCacheConfig.dataCacheEnabled | bool | `false` |  |
| settings.databaseFlags | list | `[]` |  |
| settings.denyMaintenancePeriod.endDate | string | `""` |  |
| settings.denyMaintenancePeriod.startDate | string | `""` |  |
| settings.denyMaintenancePeriod.time | string | `""` |  |
| settings.diskAutoresize | bool | `true` |  |
| settings.diskAutoresizeLimit | int | `0` |  |
| settings.diskSize | int | `10` |  |
| settings.diskType | string | `"PD_SSD"` |  |
| settings.edition | string | `""` |  |
| settings.insightsConfig.queryInsightsEnabled | bool | `false` |  |
| settings.insightsConfig.queryPlansPerMinute | int | `5` |  |
| settings.insightsConfig.queryStringLength | int | `1024` |  |
| settings.insightsConfig.recordApplicationTags | bool | `false` |  |
| settings.insightsConfig.recordClientAddress | bool | `false` |  |
| settings.ipConfiguration.allocatedIpRange | string | `""` |  |
| settings.ipConfiguration.authorizedNetworks[0].expirationTime | string | `""` |  |
| settings.ipConfiguration.authorizedNetworks[0].name | string | `""` |  |
| settings.ipConfiguration.authorizedNetworks[0].value | string | `""` |  |
| settings.ipConfiguration.enablePrivatePathForGoogleCloudServices | bool | `false` |  |
| settings.ipConfiguration.ipv4Enabled | bool | `true` |  |
| settings.ipConfiguration.privateNetworkRef.external | string | `""` |  |
| settings.locationPreference.followGaeApplication | string | `""` |  |
| settings.locationPreference.secondaryZone | string | `""` |  |
| settings.locationPreference.zone | string | `""` |  |
| settings.maintenanceWindow.day | int | `7` |  |
| settings.maintenanceWindow.hour | int | `3` |  |
| settings.maintenanceWindow.updateTrack | string | `"stable"` |  |
| settings.pricingPlan | string | `"PER_USE"` |  |
| settings.tier | string | `"db-custom-2-7680"` |  |
| users.enabled | bool | `true` |  |
| users.items[0].host | string | `"%"` |  |
| users.items[0].name | string | `"appuser"` |  |
| users.items[0].passwordSecretRef.secretRef.key | string | `"password"` |  |
| users.items[0].passwordSecretRef.secretRef.name | string | `"db-password-secret"` |  |
| users.items[0].type | string | `"BUILT_IN"` |  |

## Installing the Chart

### With Helm

To install the chart with the release name `my-release`:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/openlane-gcp-cloudsql
```

### With ArgoCD

Add new application as:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: openlane-gcp-cloudsql
spec:
  project: infra

  source:
    repoURL: "https://theopenlane.github.io/openlane-infra"
    targetRevision: "0.1.0"
    chart: openlane-gcp-cloudsql
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-cloudsql --config /charts/charts/openlane-gcp-cloudsql/ct.yaml
```

### Run pluto

In order to check if the api-version used in this chart are not deprecated, or worse, removed, we use pluto to check it:

```
docker run --rm -it -v $(pwd):/apps -v pluto:/pluto alpine/helm:3.17 template openlane-gcp-cloudsql . -f tests/pluto/values.yaml --output-dir /pluto
docker run --rm -it -v pluto:/data us-docker.pkg.dev/fairwinds-ops/oss/pluto:v5 detect-files -d /data -o yaml --ignore-deprecations -t "k8s=v1.31.0,cert-manager=v1.17.0,istio=v1.24.0" -o wide
docker volume rm pluto
```

