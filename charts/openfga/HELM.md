![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

# openlane-eso

**Homepage:** <https://docs.theopenlane.io>

## Prerequisites

- [Helm](https://helm.sh/docs/intro/install/)
- [ct](https://github.com/helm/chart-testing)
- [helm-docs](https://github.com/norwoodj/helm-docs)
- [task](https://taskfile.dev/)

Once you've installed `task` you can simply run `task install` to get the remaining dependencies installed, assuning you're using macOS and have `brew`.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://openfga.github.io/helm-charts | openFGA(openfga) | 0.2.31 |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

A Helm chart to deploy OpenFGA Server on GKE clusters for Openlane

## Source Code

* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `3` |  |
| image.repository | string | `"openfga/openfga"` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `"openfga"` |  |
| commonLabels | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| annotations | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podExtraLabels | object | `{}` |  |
| extraEnvVars | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraInitContainers | list | `[]` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| initContainer.repository | string | `"groundnuty/k8s-wait-for"` |  |
| initContainer.tag | string | `"v2.0"` |  |
| initContainer.pullPolicy | string | `"IfNotPresent"` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| livenessProbe.failureThreshold | int | `12` |  |
| livenessProbe.successThreshold | int | `1` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.successThreshold | int | `1` |  |
| startupProbe.enabled | bool | `false` |  |
| startupProbe.initialDelaySeconds | int | `60` |  |
| startupProbe.periodSeconds | int | `10` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.successThreshold | int | `1` |  |
| customLivenessProbe | object | `{}` |  |
| customReadinessProbe | object | `{}` |  |
| customStartupProbe | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `8080` |  |
| telemetry.trace.enabled | bool | `false` |  |
| telemetry.trace.otlp.endpoint | string | `nil` |  |
| telemetry.trace.otlp.tls.enabled | bool | `false` |  |
| telemetry.trace.sampleRatio | string | `nil` |  |
| telemetry.metrics.enabled | bool | `true` |  |
| telemetry.metrics.serviceMonitor.enabled | bool | `true` |  |
| telemetry.metrics.serviceMonitor.additionalLabels | object | `{}` |  |
| telemetry.metrics.serviceMonitor.annotations | object | `{}` |  |
| telemetry.metrics.serviceMonitor.jobLabel | string | `"app.kubernetes.io/name"` |  |
| telemetry.metrics.serviceMonitor.namespace | string | `"openfga"` |  |
| telemetry.metrics.serviceMonitor.namespaceSelector | object | `{}` |  |
| telemetry.metrics.serviceMonitor.scrapeInterval | string | `"30s"` |  |
| telemetry.metrics.serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| telemetry.metrics.serviceMonitor.targetLabels | list | `[]` |  |
| telemetry.metrics.serviceMonitor.relabelings | list | `[]` |  |
| telemetry.metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| telemetry.metrics.addr | string | `"0.0.0.0:2112"` |  |
| telemetry.metrics.enableRPCHistograms | string | `nil` |  |
| telemetry.metrics.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| telemetry.metrics.podAnnotations."prometheus.io/port" | string | `"{{ .Values.containerPorts.prometheus }}"` |  |
| datastore.engine | string | `"postgres"` |  |
| datastore.existingSecret | string | `"cloudsql-credentials"` |  |
| datastore.secretKeys.uriKey | string | `"uri"` |  |
| datastore.maxCacheSize | string | `nil` |  |
| datastore.maxOpenConns | string | `nil` |  |
| datastore.maxIdleConns | string | `nil` |  |
| datastore.connMaxIdleTime | string | `nil` |  |
| datastore.connMaxLifetime | string | `nil` |  |
| datastore.applyMigrations | bool | `true` |  |
| datastore.waitForMigrations | bool | `true` |  |
| datastore.migrationType | string | `"job"` |  |
| datastore.migrations.resources | object | `{}` |  |
| datastore.migrations.image.repository | string | `"groundnuty/k8s-wait-for"` |  |
| datastore.migrations.image.pullPolicy | string | `"Always"` |  |
| datastore.migrations.image.tag | string | `"v2.0"` |  |
| postgresql.enabled | bool | `false` |  |
| mysql.enabled | bool | `false` |  |
| grpc.addr | string | `"0.0.0.0:8081"` |  |
| grpc.tls.enabled | bool | `false` |  |
| grpc.tls.cert | string | `nil` |  |
| grpc.tls.key | string | `nil` |  |
| grpc.tls.ca | string | `nil` |  |
| http.enabled | bool | `true` |  |
| http.addr | string | `"0.0.0.0:8080"` |  |
| http.tls.enabled | bool | `false` |  |
| http.tls.cert | string | `nil` |  |
| http.tls.key | string | `nil` |  |
| http.upstreamTimeout | string | `nil` |  |
| http.corsAllowedOrigins[0] | string | `"*"` |  |
| http.corsAllowedHeaders[0] | string | `"*"` |  |
| authn.method | string | `nil` |  |
| authn.preshared.keys | list | `[]` |  |
| authn.preshared.keysSecret | string | `nil` |  |
| authn.oidc.audience | string | `nil` |  |
| authn.oidc.issuer | string | `nil` |  |
| playground.enabled | bool | `true` |  |
| playground.port | int | `3000` |  |
| profiler.enabled | bool | `false` |  |
| profiler.addr | string | `"0.0.0.0:3001"` |  |
| log.level | string | `"info"` |  |
| log.format | string | `"json"` |  |
| log.timestampFormat | string | `"Unix"` |  |
| checkQueryCache.enabled | bool | `false` |  |
| checkQueryCache.limit | string | `nil` |  |
| checkQueryCache.ttl | string | `nil` |  |
| experimentals | list | `[]` |  |
| maxTuplesPerWrite | string | `nil` |  |
| maxTypesPerAuthorizationModel | string | `nil` |  |
| maxAuthorizationModelSizeInBytes | string | `nil` |  |
| maxConcurrentReadsForCheck | string | `nil` |  |
| maxConcurrentReadsForListObjects | string | `nil` |  |
| maxConcurrentReadsForListUsers | string | `nil` |  |
| changelogHorizonOffset | string | `nil` |  |
| resolveNodeLimit | string | `nil` |  |
| resolveNodeBreadthLimit | string | `nil` |  |
| listObjectsDeadline | string | `nil` |  |
| listObjectsMaxResults | string | `nil` |  |
| listUsersDeadline | string | `nil` |  |
| listUsersMaxResults | string | `nil` |  |
| requestTimeout | string | `nil` |  |
| requestDurationDatastoreQueryCountBuckets[0] | int | `50` |  |
| requestDurationDatastoreQueryCountBuckets[1] | int | `200` |  |
| allowWriting1_0Models | string | `nil` |  |
| allowEvaluating1_0Models | string | `nil` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| resources | object | `{}` |  |
| lifecycle | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| affinity | object | `{}` |  |
| sidecars | list | `[]` |  |
| migrate.extraVolumes | list | `[]` |  |
| migrate.extraVolumeMounts | list | `[]` |  |
| migrate.extraInitContainers | list | `[]` |  |
| migrate.sidecars | list | `[]` |  |
| migrate.annotations."helm.sh/hook" | string | `"post-install, post-upgrade, post-rollback"` |  |
| migrate.annotations."argocd.argoproj.io/sync-wave" | string | `"0"` |  |
| migrate.labels | object | `{}` |  |
| migrate.timeout | string | `nil` |  |
| testPodSpec | object | `{}` |  |
| testContainerSpec | object | `{}` |  |
| extraObjects | list | `[]` | Array of extra K8s manifests to deploy # Note: Supports use of custom Helm templates |

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
helm install openlane-infra/openlane-eso
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-eso --config /charts/charts/openlane-eso/ct.yaml
```
