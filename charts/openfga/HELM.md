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
| https://openfga.github.io/helm-charts | openfga(openfga) | 0.2.44 |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

A Helm chart to deploy OpenFGA Server for Openlane

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
| openfga.telemetry.trace.enabled | bool | `false` |  |
| openfga.telemetry.trace.otlp.endpoint | string | `nil` |  |
| openfga.telemetry.trace.otlp.tls.enabled | bool | `false` |  |
| openfga.telemetry.trace.sampleRatio | string | `nil` |  |
| openfga.telemetry.metrics.enabled | bool | `true` |  |
| openfga.telemetry.metrics.serviceMonitor.enabled | bool | `true` |  |
| openfga.telemetry.metrics.serviceMonitor.namespace | string | `"openfga"` |  |
| openfga.datastore.engine | string | `"postgres"` |  |
| openfga.datastore.existingSecret | string | `"cloudsql-credentials"` |  |
| openfga.datastore.secretKeys.uriKey | string | `"uri"` |  |
| openfga.datastore.maxCacheSize | string | `nil` |  |
| openfga.datastore.maxOpenConns | int | `30` |  |
| openfga.datastore.maxIdleConns | int | `10` |  |
| openfga.datastore.connMaxIdleTime | string | `"1h"` |  |
| openfga.datastore.connMaxLifetime | string | `"1h"` |  |
| openfga.datastore.applyMigrations | bool | `true` |  |
| openfga.datastore.waitForMigrations | bool | `true` |  |
| openfga.datastore.migrationType | string | `"job"` |  |
| openfga.datastore.migrations.resources | object | `{}` |  |
| openfga.datastore.migrations.image.repository | string | `"groundnuty/k8s-wait-for"` |  |
| openfga.datastore.migrations.image.pullPolicy | string | `"Always"` |  |
| openfga.datastore.migrations.image.tag | string | `"v2.0"` |  |
| openfga.postgresql.enabled | bool | `false` |  |
| openfga.mysql.enabled | bool | `false` |  |
| openfga.grpc.addr | string | `"0.0.0.0:8081"` |  |
| openfga.grpc.tls.enabled | bool | `false` |  |
| openfga.grpc.tls.cert | string | `nil` |  |
| openfga.grpc.tls.key | string | `nil` |  |
| openfga.grpc.tls.ca | string | `nil` |  |
| openfga.http.enabled | bool | `true` |  |
| openfga.http.addr | string | `"0.0.0.0:8080"` |  |
| openfga.http.tls.enabled | bool | `false` |  |
| openfga.http.tls.cert | string | `nil` |  |
| openfga.http.tls.key | string | `nil` |  |
| openfga.http.upstreamTimeout | string | `nil` |  |
| openfga.http.corsAllowedOrigins[0] | string | `"*"` |  |
| openfga.http.corsAllowedHeaders[0] | string | `"*"` |  |
| openfga.authn.method | string | `"preshared"` |  |
| openfga.authn.preshared.keys | list | `[]` |  |
| openfga.authn.preshared.keysSecret | string | `"preshared-keys"` |  |
| openfga.authn.oidc.audience | string | `nil` |  |
| openfga.authn.oidc.issuer | string | `nil` |  |
| openfga.playground.enabled | bool | `false` |  |
| openfga.profiler.enabled | bool | `false` |  |
| openfga.profiler.addr | string | `"0.0.0.0:3001"` |  |
| openfga.log.level | string | `"info"` |  |
| openfga.log.format | string | `"json"` |  |
| openfga.log.timestampFormat | string | `"Unix"` |  |
| openfga.checkQueryCache.enabled | bool | `true` |  |
| openfga.checkQueryCache.limit | string | `nil` |  |
| openfga.checkQueryCache.ttl | string | `"60s"` |  |
| openfga.experimentals[0] | string | `"enable-check-optimizations"` |  |
| openfga.experimentals[1] | string | `"enable-list-objects-optimizations"` |  |
| openfga.maxTuplesPerWrite | string | `nil` |  |
| openfga.maxTypesPerAuthorizationModel | string | `nil` |  |
| openfga.maxAuthorizationModelSizeInBytes | string | `nil` |  |
| openfga.maxConcurrentReadsForCheck | int | `1000` |  |
| openfga.maxConcurrentReadsForListObjects | int | `1000` |  |
| openfga.maxConcurrentReadsForListUsers | int | `1000` |  |
| openfga.changelogHorizonOffset | string | `nil` |  |
| openfga.resolveNodeLimit | string | `nil` |  |
| openfga.resolveNodeBreadthLimit | string | `nil` |  |
| openfga.listObjectsDeadline | string | `"10s"` |  |
| openfga.listObjectsMaxResults | int | `1000` |  |
| openfga.listUsersDeadline | string | `"10s"` |  |
| openfga.listUsersMaxResults | int | `1000` |  |
| openfga.requestTimeout | string | `"10s"` |  |
| openfga.requestDurationDatastoreQueryCountBuckets[0] | int | `50` |  |
| openfga.requestDurationDatastoreQueryCountBuckets[1] | int | `200` |  |
| openfga.allowWriting1_0Models | string | `nil` |  |
| openfga.allowEvaluating1_0Models | string | `nil` |  |
| openfga.ingress.enabled | bool | `false` |  |
| openfga.ingress.className | string | `""` |  |
| openfga.ingress.annotations | object | `{}` |  |
| openfga.ingress.hosts[0].host | string | `"chart-example.local"` |  |
| openfga.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| openfga.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| openfga.ingress.tls | list | `[]` |  |
| openfga.resources | object | `{}` |  |
| openfga.lifecycle | object | `{}` |  |
| openfga.autoscaling.enabled | bool | `false` |  |
| openfga.autoscaling.minReplicas | int | `1` |  |
| openfga.autoscaling.maxReplicas | int | `100` |  |
| openfga.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| openfga.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| openfga.nodeSelector | object | `{}` |  |
| openfga.tolerations | list | `[]` |  |
| openfga.topologySpreadConstraints[0].maxSkew | int | `1` |  |
| openfga.topologySpreadConstraints[0].topologyKey | string | `"topology.kubernetes.io/zone"` |  |
| openfga.topologySpreadConstraints[0].whenUnsatisfiable | string | `"ScheduleAnyway"` |  |
| openfga.topologySpreadConstraints[0].labelSelector.matchLabels."app.kubernetes.io/name" | string | `"openfga"` |  |
| openfga.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].key | string | `"app"` |  |
| openfga.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| openfga.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].labelSelector.matchExpressions[0].values[0] | string | `"openfga"` |  |
| openfga.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].topologyKey | string | `"kubernetes.io/hostname"` |  |
| openfga.sidecars | list | `[]` |  |
| openfga.migrate.extraVolumes | list | `[]` |  |
| openfga.migrate.extraVolumeMounts | list | `[]` |  |
| openfga.migrate.extraInitContainers | list | `[]` |  |
| openfga.migrate.sidecars | list | `[]` |  |
| openfga.migrate.annotations."helm.sh/hook" | string | `nil` |  |
| openfga.migrate.annotations."helm.sh/hook-weight" | string | `nil` |  |
| openfga.migrate.annotations."helm.sh/hook-delete-policy" | string | `nil` |  |
| openfga.migrate.annotations."argocd.argoproj.io/hook" | string | `"PreSync"` |  |
| openfga.migrate.annotations."argocd.argoproj.io/sync-wave" | string | `"-1"` |  |
| openfga.migrate.timeout | string | `nil` |  |
| openfga.testPodSpec | object | `{}` |  |
| openfga.testContainerSpec | object | `{}` |  |
| podMonitoring.enabled | bool | `true` |  |
| podMonitoring.interval | string | `"30s"` |  |
| podMonitoring.scrapeTimeout | string | `nil` |  |

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
