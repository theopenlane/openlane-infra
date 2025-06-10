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
| replicaCount | int | `1` |  |
| image.repository | string | `"us-west1-docker.pkg.dev/neural-vista-433523-c1/openlane/openlane"` |  |
| image.tag | string | `"sha256:f77d88975d7be13c7cd90c70e882e227b5a2a6a64e1eef5561500a8b72325a0a"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| serviceAccountName | string | `"prod-gke-central1@prod-apps-project.iam.gserviceaccount.com"` |  |
| existingSecret | string | `""` |  |
| secret.create | bool | `false` |  |
| secret.name | string | `"openlane-app-secret"` |  |
| secret.annotations | object | `{}` |  |
| secretEnv.CORE_DB_PRIMARYDBSOURCE | string | `""` |  |
| secretEnv.CORE_JOBQUEUE_CONNECTIONURI | string | `""` |  |
| secretEnv.OPENFGA_DATASTORE_URI | string | `""` |  |
| secretEnv.RIVERBOAT_RIVER_DATABASEHOST | string | `""` |  |
| secretEnv.RIVERBOAT_RIVER_WORKERS_EMAILWORKER_CONFIG_TOKEN | string | `""` |  |
| secretEnv.CORE_AUTHZ_CREDENTIALS_APITOKEN | string | `""` |  |
| secretEnv.OPENFGA_AUTHN_PRESHARED_KEYS | string | `""` |  |
| secretEnv.CORE_SESSIONS_SIGNINGKEY | string | `""` |  |
| secretEnv.CORE_SESSIONS_ENCRYPTIONKEY | string | `""` |  |
| secretEnv.CORE_OBJECTSTORAGE_ACCESSKEY | string | `""` |  |
| secretEnv.CORE_OBJECTSTORAGE_SECRETKEY | string | `""` |  |
| secretEnv.CORE_SUBSCRIPTION_PRIVATESTRIPEKEY | string | `""` |  |
| secretEnv.CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET | string | `""` |  |
| secretEnv.CORE_AUTH_PROVIDERS_GOOGLE_CLIENTSECRET | string | `""` |  |
| secretEnv.CORE_AUTH_PROVIDERS_GITHUB_CLIENTSECRET | string | `""` |  |
| secretEnv.CORE_TOTP_SECRET | string | `""` |  |
| cloudsql.enabled | bool | `true` |  |
| cloudsql.instanceSecret | string | `"cloudsql-credentials"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `80` |  |
| ingress.enabled | bool | `true` |  |
| ingress.className | string | `"gce"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0].host | string | `"api.example.com"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls | list | `[]` |  |
| auth.token.refreshAudience | string | `"https://api.theopenlane.io"` |  |
| auth.token.issuer | string | `"https://api.theopenlane.io"` |  |
| auth.token.kid | string | `"16FFBS79AZ12168N0RAW3CEAGG"` |  |
| auth.token.jwksEndpoint | string | `"https://api.theopenlane.io/.well-known/jwks.json"` |  |
| auth.token.generateKeys | string | `"true"` |  |
| auth.token.audience | string | `"https://api.theopenlane.io"` |  |
| auth.authz.hostUrl | string | `"http://localhost:8080"` |  |
| auth.authz.createNewModel | string | `"true"` |  |
| auth.authz.credentialsApiToken | string | `""` |  |
| auth.authz.modelFile | string | `"fga/model/model.fga"` |  |
| auth.sessions.signingKey | string | `""` |  |
| auth.sessions.encryptionKey | string | `""` |  |
| auth.sessions.domain | string | `".theopenlane.io"` |  |
| auth.providers.google.redirectURL | string | `"/v1/google/callback"` |  |
| auth.providers.google.clientID | string | `"45405492545-7emofbtcl8vd81rqc4af1eqb7mtuca83.apps.googleusercontent.com"` |  |
| auth.providers.google.clientSecret | string | `""` |  |
| auth.providers.google.clientEndpoint | string | `"https://api.theopenlane.io"` |  |
| auth.providers.github.redirectURL | string | `"/v1/github/callback"` |  |
| auth.providers.github.clientID | string | `"Ov23liFCzRTms6uIou68"` |  |
| auth.providers.github.clientSecret | string | `""` |  |
| auth.providers.github.clientEndpoint | string | `"https://api.theopenlane.io"` |  |
| auth.providers.webauthn.requestOrigins | string | `"https://console.theopenlane.io"` |  |
| auth.providers.webauthn.relyingPartyID | string | `"theopenlane.io"` |  |
| auth.totp.issuer | string | `"theopenlane.io"` |  |
| auth.totp.secret | string | `""` |  |
| db.runMigrations | string | `"true"` |  |
| db.driverName | string | `"pgx"` |  |
| db.migrationProvider | string | `"goose"` |  |
| db.primaryDbSource | string | `""` |  |
| db.jobQueueConnectionUri | string | `""` |  |
| db.enableHistory | string | `"true"` |  |
| db.databasename | string | `"openlane"` |  |
| objectStorage.provider | string | `"s3"` |  |
| objectStorage.region | string | `"us-west-2"` |  |
| objectStorage.accessKey | string | `""` |  |
| objectStorage.secretKey | string | `""` |  |
| objectStorage.defaultBucket | string | `"openlane-us-west"` |  |
| subscription.enabled | string | `"true"` |  |
| subscription.publicStripeKey | string | `""` |  |
| subscription.privateStripeKey | string | `""` |  |
| subscription.stripeBillingPortalSuccessUrl | string | `"https://console.theopenlane.io/organization-settings/billing"` |  |
| subscription.stripeWebhookSecret | string | `""` |  |
| email.companyName | string | `"Openlane"` |  |
| email.templatesPath | string | `"brandedtemplates"` |  |
| email.companyAddress | string | `"5150 Broadway St · San Antonio · TX 78209"` |  |
| email.corporation | string | `"theopenlane Inc."` |  |
| email.fromEmail | string | `"no-reply@mail.theopenlane.io"` |  |
| email.supportEmail | string | `"support@theopenlane.io"` |  |
| email.urls.root | string | `"https://www.theopenlane.io"` |  |
| email.urls.product | string | `"https://console.theopenlane.io"` |  |
| email.urls.docs | string | `"https://docs.theopenlane.io"` |  |
| email.urls.verify | string | `"https://console.theopenlane.io/verify"` |  |
| email.urls.invite | string | `"https://console.theopenlane.io/invite"` |  |
| email.urls.reset | string | `"https://console.theopenlane.io/password-reset"` |  |
| email.urls.verifySubscriber | string | `"https://console.theopenlane.io/subscriber-verify"` |  |
| riverboat.image.repository | string | `"ghcr.io/theopenlane/riverboat"` |  |
| riverboat.image.tag | string | `"latest"` |  |
| riverboat.image.pullPolicy | string | `"IfNotPresent"` |  |
| riverboat.riverDatabaseHost | string | `""` |  |
| riverboat.workers.emailWorker.configDevMode | string | `"false"` |  |
| riverboat.workers.emailWorker.configToken | string | `""` |  |
| riverboat.workers.emailWorker.configFromEmail | string | `"no-reply@mail.theopenlane.io"` |  |
| geodetic.enabled | string | `"false"` |  |
| server.corsAllowOrigins | string | `"https://console.theopenlane.io,https://www.theopenlane.io,https://studio.apollographql.com,https://docs.theopenlane.io"` |  |
| server.debug | string | `"false"` |  |
| server.metricsPort | string | `":17609"` |  |
| server.complexityLimit | string | `"200"` |  |
| server.tls.enabled | bool | `false` |  |
| server.tls.certFile | string | `"server.crt"` |  |
| server.tls.certKey | string | `"server.key"` |  |
| server.tls.autoCert | bool | `false` |  |
| server.cors.enabled | bool | `true` |  |
| server.cors.prefixes | string | `""` |  |
| server.cors.allowOrigins | string | `""` |  |
| server.cors.cookieInsecure | string | `""` |  |
| server.secure.enabled | bool | `true` |  |
| server.secure.xssprotection | string | `"1; mode=block"` |  |
| server.secure.contenttypenosniff | string | `"nosniff"` |  |
| server.secure.xframeoptions | string | `"SAMEORIGIN"` |  |
| server.secure.hstspreloadenabled | bool | `false` |  |
| server.secure.hstsmaxage | int | `31536000` |  |
| server.secure.contentsecuritypolicy | string | `"default-src 'self'"` |  |
| server.secure.referrerpolicy | string | `"same-origin"` |  |
| server.secure.cspreportonly | bool | `false` |  |
| server.redirects.enabled | bool | `true` |  |
| server.redirects.redirects | string | `""` |  |
| server.redirects.code | string | `""` |  |
| server.cacheControl.enabled | bool | `true` |  |
| server.cacheControl.noCacheHeaders | string | `""` |  |
| server.cacheControl.etagHeaders | string | `""` |  |
| server.mime.enabled | bool | `true` |  |
| server.mime.mimeTypesFile | string | `""` |  |
| server.mime.defaultContentType | string | `"application/data"` |  |
| server.graphPool.maxWorkers | int | `100` |  |
| server.enableGraphExtensions | bool | `true` |  |
| server.maxResultLimit | int | `100` |  |
| openfga.datastoreEngine | string | `"postgres"` |  |
| openfga.datastoreUri | string | `""` |  |
| openfga.presharedKeys | string | `""` |  |
| openfga.authnMethod | string | `"preshared"` |  |
| openfga.listUsersMaxResults | string | `"10000"` |  |
| openfga.datastoreMaxOpenConns | string | `"240"` |  |
| openfga.logFormat | string | `"json"` |  |
| openfga.checkQueryCacheEnabled | string | `"true"` |  |
| openfga.maxConcurrentChecksPerBatchCheck | string | `"500"` |  |
| openfga.maxChecksPerBatchCheck | string | `"500"` |  |
| openfga.listObjectsDeadline | string | `"5s"` |  |
| openfga.listObjectsMaxResults | string | `"10000"` |  |
| openfga.datastoreMaxIdleConns | string | `"200"` |  |
| openfga.datastoreMetricsEnabled | string | `"true"` |  |
| openfga.metricsEnabled | string | `"true"` |  |
| openfga.checkIteratorCacheEnabled | string | `"true"` |  |
| openfga.checkQueryCacheTTL | string | `"30s"` |  |
| openfga.cacheControllerEnabled | string | `"true"` |  |
| openfga.cacheControllerTTL | string | `"30s"` |  |
| openfga.requestTimeout | string | `"5s"` |  |
| features.dbxEnabled | string | `"false"` |  |
| api.commonAnnotations | object | `{}` |  |

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
helm install openlane-infra/openlane
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane --config /charts/charts/openlane/ct.yaml
```
