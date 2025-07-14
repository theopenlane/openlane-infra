![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

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
| https://openfga.github.io/helm-charts | openfga(openfga) | 0.2.38 |

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
| openfga.replicaCount | int | `3` |  |
| openfga.image.repository | string | `"openfga/openfga"` |  |
| openfga.image.pullPolicy | string | `"Always"` |  |
| openfga.image.tag | string | `""` |  |
| openfga.imagePullSecrets | list | `[]` |  |
| openfga.nameOverride | string | `""` |  |
| openfga.fullnameOverride | string | `""` |  |
| openfga.serviceAccount.create | bool | `true` |  |
| openfga.serviceAccount.annotations."argocd.argoproj.io/hook" | string | `"PreSync"` |  |
| openfga.serviceAccount.annotations."argocd.argoproj.io/sync-wave" | string | `"-2"` |  |
| openfga.serviceAccount.name | string | `""` |  |
| openfga.annotations | object | `{}` |  |
| openfga.podAnnotations | object | `{}` |  |
| openfga.podExtraLabels | object | `{}` |  |
| openfga.extraEnvVars[0].name | string | `"OPENFGA_MAX_CHECKS_PER_BATCH_CHECK"` |  |
| openfga.extraEnvVars[0].value | string | `"500"` |  |
| openfga.extraEnvVars[1].name | string | `"OPENFGA_CHECK_CACHE_LIMIT"` |  |
| openfga.extraEnvVars[1].value | string | `"50000"` |  |
| openfga.extraEnvVars[2].name | string | `"OPENFGA_CHECK_ITERATOR_CACHE_ENABLED"` |  |
| openfga.extraEnvVars[2].value | string | `"true"` |  |
| openfga.extraEnvVars[3].name | string | `"OPENFGA_CHECK_ITERATOR_CACHE_MAX_RESULTS"` |  |
| openfga.extraEnvVars[3].value | string | `"50000"` |  |
| openfga.extraEnvVars[4].name | string | `"OPENFGA_CHECK_ITERATOR_CACHE_TTL"` |  |
| openfga.extraEnvVars[4].value | string | `"60s"` |  |
| openfga.extraEnvVars[5].name | string | `"OPENFGA_CACHE_CONTROLLER_ENABLED"` |  |
| openfga.extraEnvVars[5].value | string | `"true"` |  |
| openfga.extraEnvVars[6].name | string | `"OPENFGA_CACHE_CONTROLLER_TTL"` |  |
| openfga.extraEnvVars[6].value | string | `"60s"` |  |
| openfga.extraEnvVars[7].name | string | `"OPENFGA_CHECK_DISPATCH_THROTTLING_ENABLED"` |  |
| openfga.extraEnvVars[7].value | string | `"true"` |  |
| openfga.extraEnvVars[8].name | string | `"OPENFGA_CHECK_DISPATCH_THROTTLING_THRESHOLD"` |  |
| openfga.extraEnvVars[8].value | string | `"500"` |  |
| openfga.extraEnvVars[9].name | string | `"OPENFGA_LIST_OBJECTS_ITERATOR_CACHE_ENABLED"` |  |
| openfga.extraEnvVars[9].value | string | `"true"` |  |
| openfga.extraEnvVars[10].name | string | `"OPENFGA_LIST_OBJECTS_ITERATOR_CACHE_MAX_RESULTS"` |  |
| openfga.extraEnvVars[10].value | string | `"10000"` |  |
| openfga.extraEnvVars[11].name | string | `"OPENFGA_LIST_OBJECTS_ITERATOR_CACHE_TTL"` |  |
| openfga.extraEnvVars[11].value | string | `"60s"` |  |
| openfga.extraEnvVars[12].name | string | `"OPENFGA_LIST_OBJECTS_DISPATCH_THROTTLING_THRESHOLD"` |  |
| openfga.extraEnvVars[12].value | string | `"500"` |  |
| openfga.extraEnvVars[13].name | string | `"OPENFGA_LIST_USERS_DISPATCH_THROTTLING_ENABLED"` |  |
| openfga.extraEnvVars[13].value | string | `"true"` |  |
| openfga.extraEnvVars[14].name | string | `"OPENFGA_LIST_USERS_DISPATCH_THROTTLING_THRESHOLD"` |  |
| openfga.extraEnvVars[14].value | string | `"500"` |  |
| openfga.extraVolumes | list | `[]` |  |
| openfga.extraVolumeMounts | list | `[]` |  |
| openfga.extraInitContainers | list | `[]` |  |
| openfga.podSecurityContext | object | `{}` |  |
| openfga.securityContext | object | `{}` |  |
| openfga.initContainer.repository | string | `"groundnuty/k8s-wait-for"` |  |
| openfga.initContainer.tag | string | `"v2.0"` |  |
| openfga.initContainer.pullPolicy | string | `"IfNotPresent"` |  |
| openfga.livenessProbe.enabled | bool | `true` |  |
| openfga.livenessProbe.initialDelaySeconds | int | `60` |  |
| openfga.livenessProbe.periodSeconds | int | `10` |  |
| openfga.livenessProbe.timeoutSeconds | int | `5` |  |
| openfga.livenessProbe.failureThreshold | int | `12` |  |
| openfga.livenessProbe.successThreshold | int | `1` |  |
| openfga.readinessProbe.enabled | bool | `true` |  |
| openfga.readinessProbe.initialDelaySeconds | int | `5` |  |
| openfga.readinessProbe.periodSeconds | int | `10` |  |
| openfga.readinessProbe.timeoutSeconds | int | `5` |  |
| openfga.readinessProbe.failureThreshold | int | `6` |  |
| openfga.readinessProbe.successThreshold | int | `1` |  |
| openfga.startupProbe.enabled | bool | `false` |  |
| openfga.startupProbe.initialDelaySeconds | int | `60` |  |
| openfga.startupProbe.periodSeconds | int | `10` |  |
| openfga.startupProbe.timeoutSeconds | int | `5` |  |
| openfga.startupProbe.failureThreshold | int | `30` |  |
| openfga.startupProbe.successThreshold | int | `1` |  |
| openfga.customLivenessProbe | object | `{}` |  |
| openfga.customReadinessProbe | object | `{}` |  |
| openfga.customStartupProbe | object | `{}` |  |
| openfga.service.annotations | object | `{}` |  |
| openfga.service.type | string | `"ClusterIP"` |  |
| openfga.service.port | int | `8080` |  |
| telemetry.trace.enabled | bool | `false` |  |
| telemetry.trace.otlp.endpoint | string | `nil` |  |
| telemetry.trace.otlp.tls.enabled | bool | `false` |  |
| telemetry.trace.sampleRatio | string | `nil` |  |
| telemetry.metrics.enabled | bool | `true` |  |
| telemetry.metrics.serviceMonitor.enabled | bool | `true` |  |
| telemetry.metrics.serviceMonitor.namespace | string | `"openfga"` |  |
| telemetry.datastore.engine | string | `"postgres"` |  |
| telemetry.datastore.existingSecret | string | `"cloudsql-credentials"` |  |
| telemetry.datastore.secretKeys.uriKey | string | `"uri"` |  |
| telemetry.datastore.maxCacheSize | string | `nil` |  |
| telemetry.datastore.maxOpenConns | int | `30` |  |
| telemetry.datastore.maxIdleConns | int | `10` |  |
| telemetry.datastore.connMaxIdleTime | string | `"1h"` |  |
| telemetry.datastore.connMaxLifetime | string | `"1h"` |  |
| telemetry.datastore.applyMigrations | bool | `true` |  |
| telemetry.datastore.waitForMigrations | bool | `true` |  |
| telemetry.datastore.migrationType | string | `"job"` |  |
| telemetry.datastore.migrations.resources | object | `{}` |  |
| telemetry.datastore.migrations.image.repository | string | `"groundnuty/k8s-wait-for"` |  |
| telemetry.datastore.migrations.image.pullPolicy | string | `"Always"` |  |
| telemetry.datastore.migrations.image.tag | string | `"v2.0"` |  |
| telemetry.postgresql.enabled | bool | `false` |  |
| telemetry.mysql.enabled | bool | `false` |  |
| telemetry.grpc.addr | string | `"0.0.0.0:8081"` |  |
| telemetry.grpc.tls.enabled | bool | `false` |  |
| telemetry.grpc.tls.cert | string | `nil` |  |
| telemetry.grpc.tls.key | string | `nil` |  |
| telemetry.grpc.tls.ca | string | `nil` |  |
| telemetry.http.enabled | bool | `true` |  |
| telemetry.http.addr | string | `"0.0.0.0:8080"` |  |
| telemetry.http.tls.enabled | bool | `false` |  |
| telemetry.http.tls.cert | string | `nil` |  |
| telemetry.http.tls.key | string | `nil` |  |
| telemetry.http.upstreamTimeout | string | `nil` |  |
| telemetry.http.corsAllowedOrigins[0] | string | `"*"` |  |
| telemetry.http.corsAllowedHeaders[0] | string | `"*"` |  |
| telemetry.authn.method | string | `"preshared"` |  |
| telemetry.authn.preshared.keys | list | `[]` |  |
| telemetry.authn.preshared.keysSecret | string | `"preshared-keys"` |  |
| telemetry.authn.oidc.audience | string | `nil` |  |
| telemetry.authn.oidc.issuer | string | `nil` |  |
| telemetry.playground.enabled | bool | `false` |  |
| telemetry.profiler.enabled | bool | `false` |  |
| telemetry.profiler.addr | string | `"0.0.0.0:3001"` |  |
| telemetry.log.level | string | `"info"` |  |
| telemetry.log.format | string | `"json"` |  |
| telemetry.log.timestampFormat | string | `"Unix"` |  |
| telemetry.checkQueryCache.enabled | bool | `true` |  |
| telemetry.checkQueryCache.limit | string | `nil` |  |
| telemetry.checkQueryCache.ttl | string | `"60s"` |  |
| telemetry.experimentals[0] | string | `"enable-check-optimizations"` |  |
| telemetry.experimentals[1] | string | `"enable-list-objects-optimizations"` |  |
| telemetry.maxTuplesPerWrite | string | `nil` |  |
| telemetry.maxTypesPerAuthorizationModel | string | `nil` |  |
| telemetry.maxAuthorizationModelSizeInBytes | string | `nil` |  |
| telemetry.maxConcurrentReadsForCheck | int | `1000` |  |
| telemetry.maxConcurrentReadsForListObjects | int | `1000` |  |
| telemetry.maxConcurrentReadsForListUsers | int | `1000` |  |
| telemetry.changelogHorizonOffset | string | `nil` |  |
| telemetry.resolveNodeLimit | string | `nil` |  |
| telemetry.resolveNodeBreadthLimit | string | `nil` |  |
| telemetry.listObjectsDeadline | string | `"10s"` |  |
| telemetry.listObjectsMaxResults | int | `1000` |  |
| telemetry.listUsersDeadline | string | `"10s"` |  |
| telemetry.listUsersMaxResults | int | `1000` |  |
| telemetry.requestTimeout | string | `"10s"` |  |
| telemetry.requestDurationDatastoreQueryCountBuckets[0] | int | `50` |  |
| telemetry.requestDurationDatastoreQueryCountBuckets[1] | int | `200` |  |
| telemetry.allowWriting1_0Models | string | `nil` |  |
| telemetry.allowEvaluating1_0Models | string | `nil` |  |
| telemetry.ingress.enabled | bool | `false` |  |
| telemetry.ingress.className | string | `""` |  |
| telemetry.ingress.annotations | object | `{}` |  |
| telemetry.ingress.hosts[0].host | string | `"chart-example.local"` |  |
| telemetry.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| telemetry.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| telemetry.ingress.tls | list | `[]` |  |
| telemetry.resources | object | `{}` |  |
| telemetry.lifecycle | object | `{}` |  |
| telemetry.autoscaling.enabled | bool | `false` |  |
| telemetry.autoscaling.minReplicas | int | `1` |  |
| telemetry.autoscaling.maxReplicas | int | `100` |  |
| telemetry.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| telemetry.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| telemetry.nodeSelector | object | `{}` |  |
| telemetry.tolerations | list | `[]` |  |
| telemetry.topologySpreadConstraints | list | `[]` |  |
| telemetry.affinity | object | `{}` |  |
| telemetry.sidecars | list | `[]` |  |
| telemetry.migrate.extraVolumes | list | `[]` |  |
| telemetry.migrate.extraVolumeMounts | list | `[]` |  |
| telemetry.migrate.extraInitContainers | list | `[]` |  |
| telemetry.migrate.sidecars | list | `[]` |  |
| telemetry.migrate.annotations."helm.sh/hook" | string | `nil` |  |
| telemetry.migrate.annotations."helm.sh/hook-weight" | string | `nil` |  |
| telemetry.migrate.annotations."helm.sh/hook-delete-policy" | string | `nil` |  |
| telemetry.migrate.annotations."argocd.argoproj.io/hook" | string | `"PreSync"` |  |
| telemetry.migrate.annotations."argocd.argoproj.io/sync-wave" | string | `"-1"` |  |
| telemetry.migrate.timeout | string | `nil` |  |
| telemetry.testPodSpec | object | `{}` |  |
| telemetry.testContainerSpec | object | `{}` |  |

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
