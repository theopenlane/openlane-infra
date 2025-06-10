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
| https://openfga.github.io/helm-charts | openfga(openfga) | 0.2.31 |

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
| openfga.serviceAccount.annotations | object | `{}` |  |
| openfga.serviceAccount.name | string | `""` |  |
| openfga.annotations | object | `{}` |  |
| openfga.podAnnotations | object | `{}` |  |
| openfga.podExtraLabels | object | `{}` |  |
| openfga.extraEnvVars | list | `[]` |  |
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
| openfga.service.metrics.enabled | bool | `true` |  |
| openfga.datastore.engine | string | `"postgres"` |  |
| openfga.datastore.existingSecret | string | `"cloudsql-credentials"` |  |
| openfga.datastore.secretKeys.uriKey | string | `"uri"` |  |
| openfga.datastore.maxCacheSize | string | `nil` |  |
| openfga.datastore.maxOpenConns | int | `240` |  |
| openfga.datastore.maxIdleConns | int | `200` |  |
| openfga.datastore.connMaxIdleTime | string | `nil` |  |
| openfga.datastore.connMaxLifetime | string | `nil` |  |
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
| openfga.playground.enabled | bool | `true` |  |
| openfga.playground.port | int | `3000` |  |
| openfga.profiler.enabled | bool | `false` |  |
| openfga.profiler.addr | string | `"0.0.0.0:3001"` |  |
| openfga.log.level | string | `"info"` |  |
| openfga.log.format | string | `"json"` |  |
| openfga.log.timestampFormat | string | `"Unix"` |  |
| openfga.checkQueryCache.enabled | bool | `true` |  |
| openfga.checkQueryCache.limit | string | `nil` |  |
| openfga.checkQueryCache.ttl | string | `"30s"` |  |
| openfga.experimentals | list | `[]` |  |
| openfga.maxTuplesPerWrite | string | `nil` |  |
| openfga.maxTypesPerAuthorizationModel | string | `nil` |  |
| openfga.maxAuthorizationModelSizeInBytes | string | `nil` |  |
| openfga.maxConcurrentReadsForCheck | string | `nil` |  |
| openfga.maxConcurrentReadsForListObjects | string | `nil` |  |
| openfga.maxConcurrentReadsForListUsers | string | `nil` |  |
| openfga.changelogHorizonOffset | string | `nil` |  |
| openfga.resolveNodeLimit | string | `nil` |  |
| openfga.resolveNodeBreadthLimit | string | `nil` |  |
| openfga.listObjectsDeadline | string | `nil` |  |
| openfga.listObjectsMaxResults | int | `10000` |  |
| openfga.listUsersDeadline | string | `nil` |  |
| openfga.listUsersMaxResults | int | `10000` |  |
| openfga.requestTimeout | string | `nil` |  |
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
| openfga.topologySpreadConstraints | list | `[]` |  |
| openfga.affinity | object | `{}` |  |
| openfga.sidecars | list | `[]` |  |
| openfga.migrate.extraVolumes | list | `[]` |  |
| openfga.migrate.extraVolumeMounts | list | `[]` |  |
| openfga.migrate.extraInitContainers | list | `[]` |  |
| openfga.migrate.sidecars | list | `[]` |  |
| openfga.migrate.annotations."helm.sh/hook" | string | `"post-install, post-upgrade, post-rollback"` |  |
| openfga.migrate.annotations."argocd.argoproj.io/sync-wave" | string | `"0"` |  |
| openfga.migrate.labels | object | `{}` |  |
| openfga.migrate.timeout | string | `nil` |  |
| openfga.testPodSpec | object | `{}` |  |
| openfga.testContainerSpec | object | `{}` |  |

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
