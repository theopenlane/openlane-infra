![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

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
| global.apiDomain | string | `"api.example.com"` |  |
| openlane.nameOverride | string | `""` |  |
| openlane.replicaCount | int | `3` |  |
| openlane.image.repository | string | `"ghcr.io/theopenlane/core"` |  |
| openlane.image.tag | string | `"v0.17.3"` |  |
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
| openlane.auth.token.refreshAudience | string | `""` |  |
| openlane.auth.token.issuer | string | `""` |  |
| openlane.auth.token.kid | string | `"16FFBS79AZ12168N0RAW3CEAGG"` |  |
| openlane.auth.token.jwksEndpoint | string | `""` |  |
| openlane.auth.token.generateKeys | string | `"true"` |  |
| openlane.auth.token.audience | string | `""` |  |
| openlane.auth.authz.hostUrl | string | `"http://localhost:8080"` |  |
| openlane.auth.authz.createNewModel | string | `"true"` |  |
| openlane.auth.authz.credentialsApiToken | string | `""` |  |
| openlane.auth.authz.modelFile | string | `"fga/model/model.fga"` |  |
| openlane.auth.sessions.signingKey | string | `""` |  |
| openlane.auth.sessions.encryptionKey | string | `""` |  |
| openlane.auth.sessions.domain | string | `".theopenlane.io"` |  |
| openlane.auth.providers.google.redirectURL | string | `"/v1/google/callback"` |  |
| openlane.auth.providers.google.clientID | string | `"45405492545-7emofbtcl8vd81rqc4af1eqb7mtuca83.apps.googleusercontent.com"` |  |
| openlane.auth.providers.google.clientSecret | string | `""` |  |
| openlane.auth.providers.google.clientEndpoint | string | `""` |  |
| openlane.auth.providers.github.redirectURL | string | `"/v1/github/callback"` |  |
| openlane.auth.providers.github.clientID | string | `"Ov23liFCzRTms6uIou68"` |  |
| openlane.auth.providers.github.clientSecret | string | `""` |  |
| openlane.auth.providers.github.clientEndpoint | string | `""` |  |
| openlane.auth.providers.webauthn.requestOrigins | string | `"https://console.theopenlane.io"` |  |
| openlane.auth.providers.webauthn.relyingPartyID | string | `"theopenlane.io"` |  |
| openlane.auth.totp.issuer | string | `"theopenlane.io"` |  |
| openlane.auth.totp.secret | string | `""` |  |
| openlane.db.runMigrations | string | `"true"` |  |
| openlane.db.driverName | string | `"pgx"` |  |
| openlane.db.migrationProvider | string | `"goose"` |  |
| openlane.db.primaryDbSource | string | `""` |  |
| openlane.db.jobQueueConnectionUri | string | `""` |  |
| openlane.db.enableHistory | string | `"true"` |  |
| openlane.db.databasename | string | `"openlane"` |  |
| openlane.objectStorage.provider | string | `"s3"` |  |
| openlane.objectStorage.region | string | `"us-west-2"` |  |
| openlane.objectStorage.accessKey | string | `""` |  |
| openlane.objectStorage.secretKey | string | `""` |  |
| openlane.objectStorage.defaultBucket | string | `"openlane-us-west"` |  |
| openlane.subscription.enabled | string | `"true"` |  |
| openlane.subscription.publicStripeKey | string | `""` |  |
| openlane.subscription.privateStripeKey | string | `""` |  |
| openlane.subscription.stripeBillingPortalSuccessUrl | string | `"https://console.theopenlane.io/organization-settings/billing"` |  |
| openlane.subscription.stripeWebhookSecret | string | `""` |  |
| openlane.email.companyName | string | `"Openlane"` |  |
| openlane.email.templatesPath | string | `"brandedtemplates"` |  |
| openlane.email.companyAddress | string | `"5150 Broadway St · San Antonio · TX 78209"` |  |
| openlane.email.corporation | string | `"theopenlane Inc."` |  |
| openlane.email.fromEmail | string | `"no-reply@mail.theopenlane.io"` |  |
| openlane.email.supportEmail | string | `"support@theopenlane.io"` |  |
| openlane.email.urls.root | string | `"https://www.theopenlane.io"` |  |
| openlane.email.urls.product | string | `"https://console.theopenlane.io"` |  |
| openlane.email.urls.docs | string | `"https://docs.theopenlane.io"` |  |
| openlane.email.urls.verify | string | `"https://console.theopenlane.io/verify"` |  |
| openlane.email.urls.invite | string | `"https://console.theopenlane.io/invite"` |  |
| openlane.email.urls.reset | string | `"https://console.theopenlane.io/password-reset"` |  |
| openlane.email.urls.verifySubscriber | string | `"https://console.theopenlane.io/subscriber-verify"` |  |
| openlane.geodetic.enabled | string | `"false"` |  |
| openlane.server.corsAllowOrigins | string | `"https://console.theopenlane.io,https://www.theopenlane.io,https://studio.apollographql.com,https://docs.theopenlane.io"` |  |
| openlane.server.debug | string | `"false"` |  |
| openlane.server.metricsPort | string | `":17609"` |  |
| openlane.server.complexityLimit | string | `"200"` |  |
| openlane.server.tls.enabled | bool | `false` |  |
| openlane.server.tls.certFile | string | `"server.crt"` |  |
| openlane.server.tls.certKey | string | `"server.key"` |  |
| openlane.server.tls.autoCert | bool | `false` |  |
| openlane.server.cors.enabled | bool | `true` |  |
| openlane.server.cors.prefixes | string | `""` |  |
| openlane.server.cors.allowOrigins | string | `""` |  |
| openlane.server.cors.cookieInsecure | string | `""` |  |
| openlane.server.secure.enabled | bool | `true` |  |
| openlane.server.secure.xssprotection | string | `"1; mode=block"` |  |
| openlane.server.secure.contenttypenosniff | string | `"nosniff"` |  |
| openlane.server.secure.xframeoptions | string | `"SAMEORIGIN"` |  |
| openlane.server.secure.hstspreloadenabled | bool | `false` |  |
| openlane.server.secure.hstsmaxage | int | `31536000` |  |
| openlane.server.secure.contentsecuritypolicy | string | `"default-src 'self'"` |  |
| openlane.server.secure.referrerpolicy | string | `"same-origin"` |  |
| openlane.server.secure.cspreportonly | bool | `false` |  |
| openlane.server.redirects.enabled | bool | `true` |  |
| openlane.server.redirects.redirects | string | `""` |  |
| openlane.server.redirects.code | string | `""` |  |
| openlane.server.cacheControl.enabled | bool | `true` |  |
| openlane.server.cacheControl.noCacheHeaders | string | `""` |  |
| openlane.server.cacheControl.etagHeaders | string | `""` |  |
| openlane.server.mime.enabled | bool | `true` |  |
| openlane.server.mime.mimeTypesFile | string | `""` |  |
| openlane.server.mime.defaultContentType | string | `"application/data"` |  |
| openlane.server.graphPool.maxWorkers | int | `100` |  |
| openlane.server.enableGraphExtensions | bool | `true` |  |
| openlane.server.maxResultLimit | int | `100` |  |
| openlane.openfga.datastoreEngine | string | `"postgres"` |  |
| openlane.openfga.datastoreUri | string | `""` |  |
| openlane.openfga.presharedKeys | string | `""` |  |
| openlane.openfga.authnMethod | string | `"preshared"` |  |
| openlane.openfga.listUsersMaxResults | string | `"10000"` |  |
| openlane.openfga.datastoreMaxOpenConns | string | `"240"` |  |
| openlane.openfga.logFormat | string | `"json"` |  |
| openlane.openfga.checkQueryCacheEnabled | string | `"true"` |  |
| openlane.openfga.maxConcurrentChecksPerBatchCheck | string | `"500"` |  |
| openlane.openfga.maxChecksPerBatchCheck | string | `"500"` |  |
| openlane.openfga.listObjectsDeadline | string | `"5s"` |  |
| openlane.openfga.listObjectsMaxResults | string | `"10000"` |  |
| openlane.openfga.datastoreMaxIdleConns | string | `"200"` |  |
| openlane.openfga.datastoreMetricsEnabled | string | `"true"` |  |
| openlane.openfga.metricsEnabled | string | `"true"` |  |
| openlane.openfga.checkIteratorCacheEnabled | string | `"true"` |  |
| openlane.openfga.checkQueryCacheTTL | string | `"30s"` |  |
| openlane.openfga.cacheControllerEnabled | string | `"true"` |  |
| openlane.openfga.cacheControllerTTL | string | `"30s"` |  |
| openlane.openfga.requestTimeout | string | `"5s"` |  |
| openlane.features.dbxEnabled | string | `"false"` |  |
| openlane.api.commonAnnotations | object | `{}` |  |
| riverboat.replicaCount | int | `2` |  |
| riverboat.image.repository | string | `"ghcr.io/theopenlane/riverboat"` |  |
| riverboat.image.tag | string | `"amd64-latest"` |  |
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
