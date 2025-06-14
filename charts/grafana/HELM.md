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
| https://grafana.github.io/helm-charts | grafana(grafana) | 9.2.2 |
| https://oauth2-proxy.github.io/manifests | oauth2(oauth2-proxy) | 7.12.17 |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

A Helm chart to deploy External Secrets Operator on GKE clusters for Openlane

## Source Code

* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| grafana.admin.existingSecret | string | `"grafana-admin-secret"` |  |
| grafana.admin.userKey | string | `"admin-user"` |  |
| grafana.admin.passwordKey | string | `"admin-password"` |  |
| grafana."grafana.ini".auth.disable_login_form | bool | `true` |  |
| grafana."grafana.ini".auth.disable_signout_menu | bool | `false` |  |
| grafana."grafana.ini"."auth.proxy".enabled | bool | `true` |  |
| grafana."grafana.ini"."auth.proxy".header_name | string | `"X-Auth-Request-Email"` |  |
| grafana."grafana.ini"."auth.proxy".auto_sign_up | bool | `true` |  |
| grafana."grafana.ini"."auth.proxy".sync_ttl | int | `60` |  |
| grafana."grafana.ini"."auth.proxy".whitelist | string | `""` |  |
| grafana."grafana.ini".server.root_url | string | `"https://grafana.theopenlane.org"` |  |
| grafana."grafana.ini".paths.data | string | `"/var/lib/grafana/data"` |  |
| grafana."grafana.ini".analytics.check_for_updates | bool | `true` |  |
| grafana.datasources."datasources.yaml".apiVersion | int | `1` |  |
| grafana.datasources."datasources.yaml".datasources[0].name | string | `"Google Cloud Monitoring"` |  |
| grafana.datasources."datasources.yaml".datasources[0].type | string | `"stackdriver"` |  |
| grafana.datasources."datasources.yaml".datasources[0].access | string | `"proxy"` |  |
| grafana.datasources."datasources.yaml".datasources[0].isDefault | bool | `true` |  |
| grafana.datasources."datasources.yaml".datasources[0].jsonData.authenticationType | string | `"gce"` |  |
| grafana.datasources."datasources.yaml".datasources[0].jsonData.defaultProject | string | `"prod-apps-project"` |  |
| grafana.ingress.enabled | bool | `true` |  |
| grafana.ingress.ingressClassName | string | `"gce"` |  |
| grafana.ingress.annotations."cert-manager.io/cluster-issuer" | string | `"letsencrypt-prod"` |  |
| grafana.ingress.annotations."external-dns.alpha.kubernetes.io/hostname" | string | `"grafana.theopenlane.org"` |  |
| grafana.ingress.hosts[0] | string | `"grafana.theopenlane.org"` |  |
| grafana.ingress.tls[0].hosts[0] | string | `"grafana.theopenlane.org"` |  |
| grafana.ingress.tls[0].secretName | string | `"grafana-tls"` |  |
| grafana.persistence.enabled | bool | `true` |  |
| grafana.persistence.size | string | `"10Gi"` |  |
| oauth2.config.clientID | string | `"YOUR_GOOGLE_OAUTH_CLIENT_ID"` |  |
| oauth2.config.clientSecret | string | `"YOUR_GOOGLE_OAUTH_CLIENT_SECRET"` |  |
| oauth2.config.cookieSecret | string | `"YOUR_RANDOM_32BYTE_SECRET_BASE64"` |  |
| oauth2.config.provider | string | `"google"` |  |
| oauth2.config.emailDomains[0] | string | `"theopenlane.org"` |  |
| oauth2.config.emailDomains[1] | string | `"theopenlane.io"` |  |
| oauth2.config.whitelistDomains[0] | string | `".theopenlane.org"` |  |
| oauth2.config.whitelistDomains[1] | string | `".theopenlane.io"` |  |
| oauth2.config.redirectURL | string | `"https://grafana.theopenlane.org/oauth2/callback"` |  |
| oauth2.config.upstreams[0] | string | `"http://grafana.default.svc.cluster.local:3000/"` |  |
| oauth2.ingress.enabled | bool | `true` |  |
| oauth2.ingress.ingressClassName | string | `"gce"` |  |
| oauth2.ingress.annotations."cert-manager.io/cluster-issuer" | string | `"letsencrypt-prod"` |  |
| oauth2.ingress.annotations."external-dns.alpha.kubernetes.io/hostname" | string | `"grafana.theopenlane.org"` |  |
| oauth2.ingress.hosts[0] | string | `"grafana.theopenlane.org"` |  |
| oauth2.ingress.tls[0].hosts[0] | string | `"grafana.theopenlane.org"` |  |
| oauth2.ingress.tls[0].secretName | string | `"grafana-tls"` |  |

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
