# openlane-windmill

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
| https://windmill-labs.github.io/windmill-helm-charts | windmill | 2.0.449 |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

Helm chart for managing deployment of Windmill alongside Openlane

## Source Code

* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| windmill.postgresql.enabled | bool | `false` | enabled included Postgres container for demo purposes only using bitnami |
| windmill.postgresql.fullnameOverride | string | `"windmill-postgresql"` |  |
| windmill.postgresql.primary.persistence.enabled | bool | `true` |  |
| windmill.postgresql.primary.resources.limits.memory | string | `"1Gi"` |  |
| windmill.postgresql.primary.resources.requests.cpu | string | `"250m"` |  |
| windmill.postgresql.primary.resources.requests.memory | string | `"1024Mi"` |  |
| windmill.postgresql.auth.postgresPassword | string | `"windmill"` |  |
| windmill.postgresql.auth.database | string | `"windmill"` |  |
| windmill.minio.enabled | bool | `false` | enabled included Minio operator for s3 resource demo purposes |
| windmill.minio.fullnameOverride | string | `"windmill-minio"` |  |
| windmill.minio.mode | string | `"standalone"` |  |
| windmill.minio.primary.enabled | bool | `true` |  |
| windmill.minio.auth.rootUser | string | `"windmill"` |  |
| windmill.minio.auth.rootPassword | string | `"windmill"` |  |
| windmill.windmill.tag | string | `""` | windmill app image tag, will use the App version if not defined |
| windmill.windmill.image | string | `"ghcr.io/windmill-labs/windmill-ee"` | windmill image tag, will use the Acorresponding ee or ce image from ghcr if not defined. Do not include tag in the image name. |
| windmill.windmill.imagePullSecrets | string | `""` | image pull secrets for windmill.  by default no image pull secrets will be configured. |
| windmill.windmill.appReplicas | int | `2` | replica for the application app |
| windmill.windmill.mcpEnabled | bool | `true` | enable mcp using an additional dedicated mcp server (only 1 replica) |
| windmill.windmill.lspReplicas | int | `2` | replicas for the lsp smart assistant (not required but useful for the web IDE) |
| windmill.windmill.multiplayerReplicas | int | `1` | replicas for the multiplayer containers used by the app (ee only and ignored if enterprise not enabled) |
| windmill.windmill.databaseUrlSecretName | string | `"windmill-cloudsql"` | name of the existing secret storing the database URI, take precedence over databaseUrl. |
| windmill.windmill.databaseUrlSecretKey | string | `"dburi"` | name of the key in existing secret storing the database URI. The default key of the url is 'url' |
| windmill.windmill.databaseUrl | string | `""` | Postgres URI, pods will crashloop if database is unreachable, sets DATABASE_URL environment variable in app and worker container |
| windmill.windmill.databaseSecret | bool | `false` | whether to create a secret containing the value of databaseUrl |
| windmill.windmill.baseDomain | string | `"windmill.theopenlane.org"` | domain as shown in browser. url of this service is at: {baseProtocol}://{baseDomain} |
| windmill.windmill.baseProtocol | string | `"https"` | protocol as shown in browser, change to https etc based on your endpoint/ingress configuration, this variable and `baseDomain` are used as part of the BASE_URL environment variable in app and worker container |
| windmill.windmill.cookieDomain | string | `"windmill.theopenlane.org"` | domain to use for the cookies. Use it if windmill is hosted on a subdomain and you need to share the cookies with the hub for instance |
| windmill.windmill.pipIndexUrl | string | `""` | pass the index url to pip for private registries |
| windmill.windmill.pipExtraIndexUrl | string | `""` | pass the extra index url to pip for private registries |
| windmill.windmill.pipTrustedHost | string | `""` | pass the trusted host to pip for private registries |
| windmill.windmill.npmConfigRegistry | string | `""` | pass the npm for private registries |
| windmill.windmill.instanceEventsWebhook | string | `""` | send instance events to a webhook. Can be hooked back to windmill |
| windmill.windmill.openaiAzureBasePath | string | `""` | configure a custom openai base path for azure |
| windmill.windmill.exposeHostDocker | bool | `false` | mount the docker socket inside the container to be able to run docker command as docker client to the host docker daemon |
| windmill.windmill.rustLog | string | `"info"` | rust log level, set to debug for more information etc, sets RUST_LOG environment variable in app and worker container |
| windmill.windmill.hostAliases | list | `[]` | host aliases for all pods (can be overridden by individual worker groups) |
| windmill.windmill.workerGroups[0].name | string | `"default"` |  |
| windmill.windmill.workerGroups[0].controller | string | `"Deployment"` | Controller to use. Valid options are "Deployment" and "StatefulSet" |
| windmill.windmill.workerGroups[0].replicas | int | `2` |  |
| windmill.windmill.workerGroups[0].annotations | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.workerGroups[0].terminationGracePeriodSeconds | int | `604800` | If a job is being ran, the container will wait for it to finish before terminating until this grace period |
| windmill.windmill.workerGroups[0].labels | object | `{}` | Labels to apply to the pods |
| windmill.windmill.workerGroups[0].nodeSelector | object | `{}` | Node selector to use for scheduling the pods |
| windmill.windmill.workerGroups[0].tolerations | list | `[]` | Tolerations to apply to the pods |
| windmill.windmill.workerGroups[0].hostAliases | list | `[]` | Host aliases to apply to the pods (overrides global hostAliases if set) |
| windmill.windmill.workerGroups[0].podSecurityContext | object | `{"runAsNonRoot":false,"runAsUser":0}` | Security context to apply to the container |
| windmill.windmill.workerGroups[0].podSecurityContext.runAsUser | int | `0` | run as user. The default is 0 for root user |
| windmill.windmill.workerGroups[0].podSecurityContext.runAsNonRoot | bool | `false` | run explicitly as a non-root user. The default is false. |
| windmill.windmill.workerGroups[0].containerSecurityContext | object | `{}` | Security context to apply to the pod |
| windmill.windmill.workerGroups[0].affinity | object | `{}` | Affinity rules to apply to the pods |
| windmill.windmill.workerGroups[0].resources | object | `{"limits":{"memory":"2Gi"}}` | Resource limits and requests for the pods |
| windmill.windmill.workerGroups[0].extraEnv | list | `[]` | Extra environment variables to apply to the pods |
| windmill.windmill.workerGroups[0].extraContainers | list | `[]` | Extra sidecar containers |
| windmill.windmill.workerGroups[0].mode | string | `"worker"` |  |
| windmill.windmill.workerGroups[0].initContainers | list | `[]` | Init containers |
| windmill.windmill.workerGroups[0].volumes | list | `[]` |  |
| windmill.windmill.workerGroups[0].volumeMounts | list | `[]` |  |
| windmill.windmill.workerGroups[0].volumeClaimTemplates | list | `[]` | Volume claim templates. Only applies when controller is "StatefulSet" |
| windmill.windmill.workerGroups[0].command | list | `[]` | command override |
| windmill.windmill.workerGroups[0].exposeHostDocker | bool | `false` | mount the docker socket inside the container to be able to run docker command as docker client to the host docker daemon |
| windmill.windmill.workerGroups[1].name | string | `"native"` |  |
| windmill.windmill.workerGroups[1].controller | string | `"Deployment"` | Controller to use. Valid options are "Deployment" and "StatefulSet" |
| windmill.windmill.workerGroups[1].replicas | int | `1` |  |
| windmill.windmill.workerGroups[1].annotations | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.workerGroups[1].labels | object | `{}` | Labels to apply to the pods |
| windmill.windmill.workerGroups[1].nodeSelector | object | `{}` | Node selector to use for scheduling the pods |
| windmill.windmill.workerGroups[1].tolerations | list | `[]` | Tolerations to apply to the pods |
| windmill.windmill.workerGroups[1].hostAliases | list | `[]` | Host aliases to apply to the pods (overrides global hostAliases if set) |
| windmill.windmill.workerGroups[1].podSecurityContext | object | `{"runAsNonRoot":false,"runAsUser":0}` | Security context to apply to the container |
| windmill.windmill.workerGroups[1].podSecurityContext.runAsUser | int | `0` | run as user. The default is 0 for root user |
| windmill.windmill.workerGroups[1].podSecurityContext.runAsNonRoot | bool | `false` | run explicitly as a non-root user. The default is false. |
| windmill.windmill.workerGroups[1].containerSecurityContext | object | `{}` | Security context to apply to the pod |
| windmill.windmill.workerGroups[1].affinity | object | `{}` | Affinity rules to apply to the pods |
| windmill.windmill.workerGroups[1].resources | object | `{"limits":{"memory":"2Gi"}}` | Resource limits and requests for the pods |
| windmill.windmill.workerGroups[1].extraEnv | list | `[{"name":"NUM_WORKERS","value":"8"},{"name":"SLEEP_QUEUE","value":"200"}]` | Extra environment variables to apply to the pods |
| windmill.windmill.workerGroups[1].extraContainers | list | `[]` | Extra sidecar containers |
| windmill.windmill.workerGroups[1].mode | string | `"worker"` |  |
| windmill.windmill.workerGroups[1].volumes | list | `[]` |  |
| windmill.windmill.workerGroups[1].volumeMounts | list | `[]` |  |
| windmill.windmill.workerGroups[1].exposeHostDocker | bool | `false` | mount the docker socket inside the container to be able to run docker command as docker client to the host docker daemon |
| windmill.windmill.workerGroups[1].volumeClaimTemplates | list | `[]` | Volume claim templates. Only applies when controller is "StatefulSet" |
| windmill.windmill.workerGroups[2].name | string | `"gpu"` |  |
| windmill.windmill.workerGroups[2].controller | string | `"Deployment"` | Controller to use. Valid options are "Deployment" and "StatefulSet" |
| windmill.windmill.workerGroups[2].replicas | int | `0` |  |
| windmill.windmill.workerGroups[2].annotations | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.workerGroups[2].labels | object | `{}` | Labels to apply to the pods |
| windmill.windmill.workerGroups[2].nodeSelector | object | `{}` | Node selector to use for scheduling the pods |
| windmill.windmill.workerGroups[2].tolerations | list | `[]` | Tolerations to apply to the pods |
| windmill.windmill.workerGroups[2].hostAliases | list | `[]` | Host aliases to apply to the pods (overrides global hostAliases if set) |
| windmill.windmill.workerGroups[2].podSecurityContext | object | `{"runAsNonRoot":false,"runAsUser":0}` | Security context to apply to the container |
| windmill.windmill.workerGroups[2].podSecurityContext.runAsUser | int | `0` | run as user. The default is 0 for root user |
| windmill.windmill.workerGroups[2].podSecurityContext.runAsNonRoot | bool | `false` | run explicitly as a non-root user. The default is false. |
| windmill.windmill.workerGroups[2].containerSecurityContext | object | `{}` | Security context to apply to the pod |
| windmill.windmill.workerGroups[2].affinity | object | `{}` | Affinity rules to apply to the pods |
| windmill.windmill.workerGroups[2].resources | object | `{"limits":{"memory":"2Gi"}}` | Resource limits and requests for the pods |
| windmill.windmill.workerGroups[2].extraEnv | list | `[]` | Extra environment variables to apply to the pods |
| windmill.windmill.workerGroups[2].extraContainers | list | `[]` | Extra sidecar containers |
| windmill.windmill.workerGroups[2].mode | string | `"worker"` |  |
| windmill.windmill.workerGroups[2].volumes | list | `[]` |  |
| windmill.windmill.workerGroups[2].volumeMounts | list | `[]` |  |
| windmill.windmill.workerGroups[2].command | list | `[]` | command override |
| windmill.windmill.workerGroups[2].exposeHostDocker | bool | `false` | mount the docker socket inside the container to be able to run docker command as docker client to the host docker daemon |
| windmill.windmill.workerGroups[2].volumeClaimTemplates | list | `[]` | Volume claim templates. Only applies when controller is "StatefulSet" |
| windmill.windmill.app.annotations | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.app.labels | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.app.nodeSelector | object | `{}` | Node selector to use for scheduling the pods |
| windmill.windmill.app.tolerations | list | `[]` | Tolerations to apply to the pods |
| windmill.windmill.app.hostAliases | list | `[]` | Host aliases to apply to the pods (overrides global hostAliases if set) |
| windmill.windmill.app.securityContext | object | `{}` | legacy, use podSecurityContext instead |
| windmill.windmill.app.podSecurityContext | object | `{"runAsNonRoot":false,"runAsUser":0}` | Security context to apply to the pods |
| windmill.windmill.app.podSecurityContext.runAsUser | int | `0` | run as user. The default is 0 for root user |
| windmill.windmill.app.podSecurityContext.runAsNonRoot | bool | `false` | run explicitly as a non-root user. The default is false. |
| windmill.windmill.app.containerSecurityContext | object | `{}` |  |
| windmill.windmill.app.affinity | object | `{}` | Affinity rules to apply to the pods |
| windmill.windmill.app.resources | object | `{"limits":{"memory":"2Gi"}}` | Resource limits and requests for the pods |
| windmill.windmill.app.extraEnv | list | `[]` | Extra environment variables to apply to the pods |
| windmill.windmill.app.initContainers | list | `[]` | Init containers |
| windmill.windmill.app.extraContainers | list | `[]` | Extra sidecar containers |
| windmill.windmill.app.volumes | list | `[]` | volumes |
| windmill.windmill.app.volumeMounts | list | `[]` |  |
| windmill.windmill.app.autoscaling.enabled | bool | `false` | enable or disable autoscaling |
| windmill.windmill.app.autoscaling.maxReplicas | int | `10` | maximum autoscaler replicas |
| windmill.windmill.app.autoscaling.targetCPUUtilizationPercentage | int | `80` | target CPU utilization |
| windmill.windmill.app.service.annotations | object | `{}` | Annotations to apply to the service |
| windmill.windmill.app.smtpService | object | `{"annotations":{},"enabled":false}` | smtp service configuration for email triggers |
| windmill.windmill.app.smtpService.enabled | bool | `false` | whether to expose the smtp port of the app using a load balancer service |
| windmill.windmill.app.smtpService.annotations | object | `{}` | annotations to apply to the service |
| windmill.windmill.lsp.tag | string | `"latest"` |  |
| windmill.windmill.lsp.enabled | bool | `true` | enable or disable lsp |
| windmill.windmill.lsp.annotations | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.lsp.labels | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.lsp.nodeSelector | object | `{}` | Node selector to use for scheduling the pods |
| windmill.windmill.lsp.tolerations | list | `[]` | Tolerations to apply to the pods |
| windmill.windmill.lsp.securityContext | string | `nil` | legacy, use podSecurityContext instead |
| windmill.windmill.lsp.podSecurityContext | object | `{"runAsNonRoot":false,"runAsUser":0}` | Security context to apply to the pods |
| windmill.windmill.lsp.podSecurityContext.runAsUser | int | `0` | run as user. The default is 0 for root user |
| windmill.windmill.lsp.podSecurityContext.runAsNonRoot | bool | `false` | run explicitly as a non-root user. The default is false. |
| windmill.windmill.lsp.containerSecurityContext | object | `{}` |  |
| windmill.windmill.lsp.affinity | object | `{}` | Affinity rules to apply to the pods |
| windmill.windmill.lsp.resources | object | `{"limits":{"memory":"1Gi"}}` | Resource limits and requests for the pods |
| windmill.windmill.lsp.extraEnv | list | `[]` | Extra environment variables to apply to the pods |
| windmill.windmill.lsp.autoscaling.enabled | bool | `false` | enable or disable autoscaling |
| windmill.windmill.lsp.autoscaling.maxReplicas | int | `10` | maximum autoscaler replicas |
| windmill.windmill.lsp.autoscaling.targetCPUUtilizationPercentage | int | `80` | target CPU utilization |
| windmill.windmill.lsp.service.annotations | object | `{}` | Annotations to apply to the service |
| windmill.windmill.multiplayer.tag | string | `"latest"` |  |
| windmill.windmill.multiplayer.enabled | bool | `true` | enable or disable multiplayer |
| windmill.windmill.multiplayer.annotations | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.multiplayer.labels | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.multiplayer.nodeSelector | object | `{}` | Node selector to use for scheduling the pods |
| windmill.windmill.multiplayer.tolerations | list | `[]` | Tolerations to apply to the pods |
| windmill.windmill.multiplayer.securityContext | string | `nil` | legacy, use podSecurityContext instead |
| windmill.windmill.multiplayer.podSecurityContext | object | `{"runAsNonRoot":false,"runAsUser":0}` | Security context to apply to the pods |
| windmill.windmill.multiplayer.podSecurityContext.runAsUser | int | `0` | run as user. The default is 0 for root user |
| windmill.windmill.multiplayer.podSecurityContext.runAsNonRoot | bool | `false` | run explicitly as a non-root user. The default is false. |
| windmill.windmill.multiplayer.containerSecurityContext | object | `{}` |  |
| windmill.windmill.multiplayer.affinity | object | `{}` | Affinity rules to apply to the pods |
| windmill.windmill.multiplayer.resources | object | `{"limits":{"memory":"1Gi"}}` | Resource limits and requests for the pods |
| windmill.windmill.multiplayer.extraEnv | list | `[]` | Extra environment variables to apply to the pods |
| windmill.windmill.multiplayer.autoscaling.enabled | bool | `false` | enable or disable autoscaling |
| windmill.windmill.multiplayer.autoscaling.maxReplicas | int | `10` | maximum autoscaler replicas |
| windmill.windmill.multiplayer.autoscaling.targetCPUUtilizationPercentage | int | `80` | target CPU utilization |
| windmill.windmill.indexer.enabled | bool | `true` | enable or disable indexer |
| windmill.windmill.indexer.annotations | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.indexer.labels | object | `{}` | Annotations to apply to the pods |
| windmill.windmill.indexer.nodeSelector | object | `{}` | Node selector to use for scheduling the pods |
| windmill.windmill.indexer.tolerations | list | `[]` | Tolerations to apply to the pods |
| windmill.windmill.indexer.securityContext | string | `nil` | legacy, use podSecurityContext instead |
| windmill.windmill.indexer.podSecurityContext | object | `{"runAsNonRoot":false,"runAsUser":0}` | Security context to apply to the pods |
| windmill.windmill.indexer.podSecurityContext.runAsUser | int | `0` | run as user. The default is 0 for root user |
| windmill.windmill.indexer.podSecurityContext.runAsNonRoot | bool | `false` | run explicitly as a non-root user. The default is false. |
| windmill.windmill.indexer.containerSecurityContext | object | `{}` |  |
| windmill.windmill.indexer.affinity | object | `{}` | Affinity rules to apply to the pods |
| windmill.windmill.indexer.resources | object | `{"limits":{"memory":"2Gi"}}` | Resource limits and requests for the pods |
| windmill.windmill.indexer.extraEnv | list | `[]` | Extra environment variables to apply to the pods |
| windmill.ingress.enabled | bool | `false` | enable/disable included ingress resource |
| windmill.ingress.className | string | `""` |  |
| windmill.ingress.annotations | object | `{}` |  |
| windmill.ingress.tls | list | `[]` | TLS config for the ingress resource. Useful when using cert-manager and nginx-ingress |
| windmill.enterprise.enabled | bool | `true` | enable Windmill Enterprise, requires license key. |
| windmill.enterprise.licenseKeySecretName | string | `"windmill-enterprise-license"` | name of the secret storing the enterprise license key, take precedence over licenseKey string. |
| windmill.enterprise.licenseKeySecretKey | string | `"licenseKey"` | name of the key in secret storing the enterprise license key. The default key is 'licenseKey' |
| windmill.enterprise.licenseKey | string | `""` | enterprise license key. (Recommended to avoid: It is recommended to pass it from the Instance settings UI instead) |
| windmill.enterprise.enabledS3DistributedCache | bool | `false` |  |
| windmill.enterprise.s3CacheBucket | string | `""` | S3 bucket to use for dependency cache. Sets S3_CACHE_BUCKET environment variable in worker container |
| windmill.enterprise.samlMetadata | string | `""` | SAML Metadata URL/Content to enable SAML SSO (Can be set in the Instance Settings UI which is the recommended method) |
| windmill.enterprise.scimToken | string | `""` | SCIM token (Can be set in the instance settings UI which is the recommended method) |
| windmill.enterprise.scimTokenSecretName | string | `""` | name of the secret storing the SCIM token, takes precedence over SCIM token string. |
| windmill.enterprise.scimTokenSecretKey | string | `"scimToken"` | name of the key in secret storing the SCIM token. The default key of the SCIM token is 'scimToken' |
| windmill.enterprise.nsjail | bool | `false` | use nsjail for sandboxing |
| windmill.serviceAccount.create | bool | `true` |  |
| windmill.serviceAccount.name | string | `""` |  |
| windmill.serviceAccount.annotations | object | `{}` |  |
| windmill.hub.enabled | bool | `true` | enable Windmill Hub, requires Windmill Enterprise and license key |
| windmill.hub.licenseKey | string | `""` | enterprise license key |
| windmill.hub.replicas | int | `1` | replicas for the hub |
| windmill.hub.image | string | `"ghcr.io/windmill-labs/windmill-ee"` | image |
| windmill.hub.databaseUrlSecretName | string | `"windmill-cloudsql"` | name of the secret storing the database URI, take precedence over databaseUrl. |
| windmill.hub.databaseUrlSecretKey | string | `"dburi"` | name of the key in secret storing the database URI. The default key of the url is 'url' |
| windmill.hub.databaseUrl | string | `""` | Postgres URI, pods will crashloop if database is unreachable, sets DATABASE_URL environment variable in app and worker container |
| windmill.hub.databaseSecret | bool | `false` | whether to create a secret containing the value of databaseUrl |
| windmill.hub.baseDomain | string | `"hub.windmill"` | you also need to set the cookieDomain to the root domain in the app configuration |
| windmill.hub.baseProtocol | string | `"https"` | protocol as shown in browser, change to https etc based on your endpoint/ingress configuration, this variable and `baseDomain` are used as part of the BASE_URL environment variable in app and worker container |
| windmill.hub.annotations | object | `{}` | Annotations to apply to the pods |
| windmill.hub.labels | object | `{}` | Annotations to apply to the pods |
| windmill.hub.nodeSelector | object | `{}` | Node selector to use for scheduling the pods |
| windmill.hub.tolerations | list | `[]` | Tolerations to apply to the pods |
| windmill.hub.securityContext | string | `nil` | legacy, use podSecurityContext instead |
| windmill.hub.podSecurityContext | object | `{"runAsNonRoot":false,"runAsUser":0}` | Security context to apply to the pods |
| windmill.hub.podSecurityContext.runAsUser | int | `0` | run as user. The default is 0 for root user |
| windmill.hub.podSecurityContext.runAsNonRoot | bool | `false` | run explicitly as a non-root user. The default is false. |
| windmill.hub.containerSecurityContext | object | `{}` |  |
| windmill.hub.affinity | object | `{}` | Affinity rules to apply to the pods |
| windmill.hub.resources | object | `{"limits":{"memory":"2Gi"}}` | Resource limits and requests for the pods |
| windmill.hub.extraEnv | list | `[]` | Extra environment variables to apply to the pods |
| windmill.hub-postgresql.enabled | bool | `false` | enabled included Postgres container for demo purposes only using bitnami |
| windmill.hub-postgresql.fullnameOverride | string | `"windmill-hub-postgresql"` |  |
| windmill.hub-postgresql.primary.persistence.enabled | bool | `true` |  |
| windmill.hub-postgresql.primary.resources.limits.memory | string | `"2Gi"` |  |
| windmill.hub-postgresql.primary.resources.requests.cpu | string | `"1"` |  |
| windmill.hub-postgresql.primary.resources.requests.memory | string | `"1024Mi"` |  |
| windmill.hub-postgresql.auth.postgresPassword | string | `"windmill"` |  |
| windmill.hub-postgresql.auth.database | string | `"windmillhub"` |  |

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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-windmill --config /charts/charts/openlane-windmill/ct.yaml
```
