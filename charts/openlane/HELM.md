# openlane

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

A Helm chart to deploy the core Openlane server on GKE clusters

## Source Code

* <https://github.com/theopenlane/core>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| openlane.nameOverride | string | `""` |  |
| openlane.replicaCount | int | `3` |  |
| openlane.image.repository | string | `"ghcr.io/theopenlane/core"` |  |
| openlane.image.tag | string | `"v0.29.3"` |  |
| openlane.image.pullPolicy | string | `"IfNotPresent"` |  |
| openlane.serviceAccountName | object | `{}` |  |
| openlane.existingSecret | string | `""` |  |
| openlane.secret.create | bool | `false` |  |
| openlane.secret.name | string | `"openlane-app-secret"` |  |
| openlane.secret.annotations | object | `{}` |  |
| openlane.secretEnv.CORE_DB_PRIMARYDBSOURCE | string | `""` |  |
| openlane.secretEnv.CORE_JOBQUEUE_CONNECTIONURI | string | `""` |  |
| openlane.secretEnv.OPENFGA_DATASTORE_URI | string | `""` |  |
| openlane.secretEnv.RIVERBOAT_RIVER_DATABASEHOST | string | `""` |  |
| openlane.secretEnv.RIVERBOAT_RIVER_WORKERS_EMAILWORKER_CONFIG_TOKEN | string | `""` |  |
| openlane.secretEnv.CORE_AUTHZ_CREDENTIALS_APITOKEN | string | `""` |  |
| openlane.secretEnv.OPENFGA_AUTHN_PRESHARED_KEYS | string | `""` |  |
| openlane.secretEnv.CORE_SESSIONS_SIGNINGKEY | string | `""` |  |
| openlane.secretEnv.CORE_SESSIONS_ENCRYPTIONKEY | string | `""` |  |
| openlane.secretEnv.CORE_OBJECTSTORAGE_ACCESSKEY | string | `""` |  |
| openlane.secretEnv.CORE_OBJECTSTORAGE_SECRETKEY | string | `""` |  |
| openlane.secretEnv.CORE_SUBSCRIPTION_PRIVATESTRIPEKEY | string | `""` |  |
| openlane.secretEnv.CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET | string | `""` |  |
| openlane.secretEnv.CORE_AUTH_PROVIDERS_GOOGLE_CLIENTSECRET | string | `""` |  |
| openlane.secretEnv.CORE_AUTH_PROVIDERS_GITHUB_CLIENTSECRET | string | `""` |  |
| openlane.secretEnv.CORE_TOTP_SECRET | string | `""` |  |
| openlane.secretEnv.CORE_SLACK_WEBHOOKURL | string | `""` |  |
| openlane.cloudsql.enabled | bool | `true` |  |
| openlane.cloudsql.instanceSecret | string | `"cloudsql-credentials"` |  |
| openlane.service.type | string | `"ClusterIP"` |  |
| openlane.service.port | int | `80` |  |
| openlane.ingress.enabled | bool | `true` |  |
| openlane.ingress.className | string | `"gce"` |  |
| openlane.ingress.annotations | object | `{}` |  |
| openlane.ingress.hosts[0].host | string | `""` |  |
| openlane.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| openlane.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| openlane.ingress.tls | list | `[]` |  |
| openlane.coreConfiguration.server | string | `nil` | Server contains the echo server settings |
| openlane.externalSecrets | object | `{"enabled":true,"secrets":{"core-entconfig-summarizer-llm-gemini-credentialsjson":{"enabled":true,"remoteKey":"core-entconfig-summarizer-llm-gemini-credentialsjson","secretKey":"CORE_ENTCONFIG_SUMMARIZER_LLM_GEMINI_CREDENTIALSJSON"},"core-keywatcher-secretmanager":{"enabled":true,"remoteKey":"core-keywatcher-secretmanager","secretKey":"CORE_KEYWATCHER_SECRETMANAGER"},"core-objectstorage-accesskey":{"enabled":true,"remoteKey":"core-objectstorage-accesskey","secretKey":"CORE_OBJECTSTORAGE_ACCESSKEY"},"core-objectstorage-credentialsjson":{"enabled":true,"remoteKey":"core-objectstorage-credentialsjson","secretKey":"CORE_OBJECTSTORAGE_CREDENTIALSJSON"},"core-objectstorage-secretkey":{"enabled":true,"remoteKey":"core-objectstorage-secretkey","secretKey":"CORE_OBJECTSTORAGE_SECRETKEY"},"core-server-secretmanager":{"enabled":true,"remoteKey":"core-server-secretmanager","secretKey":"CORE_SERVER_SECRETMANAGER"},"core-slack-webhookurl":{"enabled":true,"remoteKey":"core-slack-webhookurl","secretKey":"CORE_SLACK_WEBHOOKURL"},"core-subscription-privatestripekey":{"enabled":true,"remoteKey":"core-subscription-privatestripekey","secretKey":"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"},"core-subscription-stripewebhooksecret":{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecret","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"}}}` | External Secrets configuration |
| openlane.externalSecrets.enabled | bool | `true` | Enable external secrets integration |
| openlane.externalSecrets.secrets | object | `{"core-entconfig-summarizer-llm-gemini-credentialsjson":{"enabled":true,"remoteKey":"core-entconfig-summarizer-llm-gemini-credentialsjson","secretKey":"CORE_ENTCONFIG_SUMMARIZER_LLM_GEMINI_CREDENTIALSJSON"},"core-keywatcher-secretmanager":{"enabled":true,"remoteKey":"core-keywatcher-secretmanager","secretKey":"CORE_KEYWATCHER_SECRETMANAGER"},"core-objectstorage-accesskey":{"enabled":true,"remoteKey":"core-objectstorage-accesskey","secretKey":"CORE_OBJECTSTORAGE_ACCESSKEY"},"core-objectstorage-credentialsjson":{"enabled":true,"remoteKey":"core-objectstorage-credentialsjson","secretKey":"CORE_OBJECTSTORAGE_CREDENTIALSJSON"},"core-objectstorage-secretkey":{"enabled":true,"remoteKey":"core-objectstorage-secretkey","secretKey":"CORE_OBJECTSTORAGE_SECRETKEY"},"core-server-secretmanager":{"enabled":true,"remoteKey":"core-server-secretmanager","secretKey":"CORE_SERVER_SECRETMANAGER"},"core-slack-webhookurl":{"enabled":true,"remoteKey":"core-slack-webhookurl","secretKey":"CORE_SLACK_WEBHOOKURL"},"core-subscription-privatestripekey":{"enabled":true,"remoteKey":"core-subscription-privatestripekey","secretKey":"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"},"core-subscription-stripewebhooksecret":{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecret","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"}}` | List of external secrets to create |
| openlane.externalSecrets.secrets.core-server-secretmanager | object | `{"enabled":true,"remoteKey":"core-server-secretmanager","secretKey":"CORE_SERVER_SECRETMANAGER"}` | core-server-secretmanager secret configuration |
| openlane.externalSecrets.secrets.core-server-secretmanager.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-server-secretmanager.secretKey | string | `"CORE_SERVER_SECRETMANAGER"` | Environment variable key for server.secretManager |
| openlane.externalSecrets.secrets.core-server-secretmanager.remoteKey | string | `"core-server-secretmanager"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-entconfig-summarizer-llm-gemini-credentialsjson | object | `{"enabled":true,"remoteKey":"core-entconfig-summarizer-llm-gemini-credentialsjson","secretKey":"CORE_ENTCONFIG_SUMMARIZER_LLM_GEMINI_CREDENTIALSJSON"}` | core-entconfig-summarizer-llm-gemini-credentialsjson secret configuration |
| openlane.externalSecrets.secrets.core-entconfig-summarizer-llm-gemini-credentialsjson.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-entconfig-summarizer-llm-gemini-credentialsjson.secretKey | string | `"CORE_ENTCONFIG_SUMMARIZER_LLM_GEMINI_CREDENTIALSJSON"` | Environment variable key for entConfig.summarizer.llm.gemini.credentialsJSON |
| openlane.externalSecrets.secrets.core-entconfig-summarizer-llm-gemini-credentialsjson.remoteKey | string | `"core-entconfig-summarizer-llm-gemini-credentialsjson"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-objectstorage-accesskey | object | `{"enabled":true,"remoteKey":"core-objectstorage-accesskey","secretKey":"CORE_OBJECTSTORAGE_ACCESSKEY"}` | core-objectstorage-accesskey secret configuration |
| openlane.externalSecrets.secrets.core-objectstorage-accesskey.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-objectstorage-accesskey.secretKey | string | `"CORE_OBJECTSTORAGE_ACCESSKEY"` | Environment variable key for objectStorage.accessKey |
| openlane.externalSecrets.secrets.core-objectstorage-accesskey.remoteKey | string | `"core-objectstorage-accesskey"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-objectstorage-secretkey | object | `{"enabled":true,"remoteKey":"core-objectstorage-secretkey","secretKey":"CORE_OBJECTSTORAGE_SECRETKEY"}` | core-objectstorage-secretkey secret configuration |
| openlane.externalSecrets.secrets.core-objectstorage-secretkey.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-objectstorage-secretkey.secretKey | string | `"CORE_OBJECTSTORAGE_SECRETKEY"` | Environment variable key for objectStorage.secretKey |
| openlane.externalSecrets.secrets.core-objectstorage-secretkey.remoteKey | string | `"core-objectstorage-secretkey"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-objectstorage-credentialsjson | object | `{"enabled":true,"remoteKey":"core-objectstorage-credentialsjson","secretKey":"CORE_OBJECTSTORAGE_CREDENTIALSJSON"}` | core-objectstorage-credentialsjson secret configuration |
| openlane.externalSecrets.secrets.core-objectstorage-credentialsjson.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-objectstorage-credentialsjson.secretKey | string | `"CORE_OBJECTSTORAGE_CREDENTIALSJSON"` | Environment variable key for objectStorage.credentialsJSON |
| openlane.externalSecrets.secrets.core-objectstorage-credentialsjson.remoteKey | string | `"core-objectstorage-credentialsjson"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-subscription-privatestripekey | object | `{"enabled":true,"remoteKey":"core-subscription-privatestripekey","secretKey":"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"}` | core-subscription-privatestripekey secret configuration |
| openlane.externalSecrets.secrets.core-subscription-privatestripekey.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-subscription-privatestripekey.secretKey | string | `"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"` | Environment variable key for subscription.privateStripeKey |
| openlane.externalSecrets.secrets.core-subscription-privatestripekey.remoteKey | string | `"core-subscription-privatestripekey"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-subscription-stripewebhooksecret | object | `{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecret","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"}` | core-subscription-stripewebhooksecret secret configuration |
| openlane.externalSecrets.secrets.core-subscription-stripewebhooksecret.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-subscription-stripewebhooksecret.secretKey | string | `"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"` | Environment variable key for subscription.stripeWebhookSecret |
| openlane.externalSecrets.secrets.core-subscription-stripewebhooksecret.remoteKey | string | `"core-subscription-stripewebhooksecret"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-keywatcher-secretmanager | object | `{"enabled":true,"remoteKey":"core-keywatcher-secretmanager","secretKey":"CORE_KEYWATCHER_SECRETMANAGER"}` | core-keywatcher-secretmanager secret configuration |
| openlane.externalSecrets.secrets.core-keywatcher-secretmanager.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-keywatcher-secretmanager.secretKey | string | `"CORE_KEYWATCHER_SECRETMANAGER"` | Environment variable key for keywatcher.secretManager |
| openlane.externalSecrets.secrets.core-keywatcher-secretmanager.remoteKey | string | `"core-keywatcher-secretmanager"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-slack-webhookurl | object | `{"enabled":true,"remoteKey":"core-slack-webhookurl","secretKey":"CORE_SLACK_WEBHOOKURL"}` | core-slack-webhookurl secret configuration |
| openlane.externalSecrets.secrets.core-slack-webhookurl.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-slack-webhookurl.secretKey | string | `"CORE_SLACK_WEBHOOKURL"` | Environment variable key for slack.webhookURL |
| openlane.externalSecrets.secrets.core-slack-webhookurl.remoteKey | string | `"core-slack-webhookurl"` | Remote key in GCP Secret Manager |
| podMonitoring.enabled | bool | `true` |  |
| podMonitoring.interval | string | `"30s"` |  |
| podMonitoring.scrapeTimeout | string | `nil` |  |
| podMonitor.enabled | bool | `true` | If `true`, create a PodMonitor resource to support the Prometheus Operator. |
| podMonitor.additionalLabels | object | `{}` | Additional labels for the PodMonitor. |
| podMonitor.annotations | object | `{}` | Annotations to add to the PodMonitor. |
| podMonitor.namespace | string | `nil` | If set create the PodMonitor in an alternate namespace. |
| podMonitor.interval | string | `nil` | Interval at which Prometheus scrapes metrics. |
| podMonitor.scrapeTimeout | string | `nil` | Timeout if metrics cannot be retrieved in given time interval. |
| riverboat.replicaCount | int | `2` |  |
| riverboat.image.repository | string | `"ghcr.io/theopenlane/riverboat"` |  |
| riverboat.image.tag | string | `"amd64-v0.2.2"` |  |
| riverboat.image.pullPolicy | string | `"IfNotPresent"` |  |
| riverboat.riverDatabaseHost | string | `""` |  |
| riverboat.workers.emailWorker.configDevMode | string | `"false"` |  |
| riverboat.workers.emailWorker.configToken | string | `""` |  |
| riverboat.workers.emailWorker.configFromEmail | string | `"no-reply@mail.theopenlane.io"` |  |
| riverboatui.image.repository | string | `"ghcr.io/riverqueue/riverui"` |  |
| riverboatui.image.tag | string | `"latest"` |  |
| riverboatui.image.pullPolicy | string | `"IfNotPresent"` |  |
| riverboatui.riverDatabaseHost | string | `""` |  |
| riverboatui.servicePort | int | `8080` |  |
| riverboatui.secretName | string | `"riverboatui-app-secret"` |  |

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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane --config /charts/charts/openlane/ct.yaml
```
