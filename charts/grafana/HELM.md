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
| https://grafana.github.io/helm-charts | grafana(grafana) | 9.3.0 |
| https://oauth2-proxy.github.io/manifests | oauth2(oauth2-proxy) | 7.12.19 |

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
| grafana."grafana.ini".auth.disable_login_form | bool | `true` |  |
| grafana."grafana.ini".auth.disable_signout_menu | bool | `false` |  |
| grafana."grafana.ini"."auth.anonymous".enabled | bool | `true` |  |
| grafana."grafana.ini"."auth.anonymous".org_role | string | `"Admin"` |  |
| grafana."grafana.ini"."auth.proxy".enabled | bool | `true` |  |
| grafana."grafana.ini"."auth.proxy".header_name | string | `"X-Auth-Request-Email"` |  |
| grafana."grafana.ini"."auth.proxy".auto_sign_up | bool | `true` |  |
| grafana."grafana.ini"."auth.proxy".sync_ttl | int | `60` |  |
| grafana."grafana.ini"."auth.proxy".whitelist | string | `""` |  |
| grafana."grafana.ini".server.root_url | string | `"https://grafana.theopenlane.org"` |  |
| grafana."grafana.ini".paths.data | string | `"/var/lib/grafana/data"` |  |
| grafana."grafana.ini".analytics.check_for_updates | bool | `true` |  |
| grafana."grafana.ini".users.auto_assign_org_role | string | `"Admin"` |  |
| grafana.datasources."datasources.yaml".apiVersion | int | `1` |  |
| grafana.datasources."datasources.yaml".datasources[0].name | string | `"Google Cloud Monitoring"` |  |
| grafana.datasources."datasources.yaml".datasources[0].type | string | `"stackdriver"` |  |
| grafana.datasources."datasources.yaml".datasources[0].access | string | `"proxy"` |  |
| grafana.datasources."datasources.yaml".datasources[0].editable | bool | `true` |  |
| grafana.datasources."datasources.yaml".datasources[0].orgId | int | `1` |  |
| grafana.datasources."datasources.yaml".datasources[0].isDefault | bool | `true` |  |
| grafana.datasources."datasources.yaml".datasources[0].jsonData.authenticationType | string | `"gce"` |  |
| grafana.datasources."datasources.yaml".datasources[0].jsonData.defaultProject | string | `"prod-apps-project"` |  |
| grafana.persistence.enabled | bool | `true` |  |
| grafana.persistence.size | string | `"10Gi"` |  |
| grafana.plugins[0] | string | `"grafana-clock-panel"` |  |
| grafana.plugins[1] | string | `"digrich-bubblechart-panel"` |  |
| grafana.plugins[2] | string | `"natel-discrete-panel"` |  |
| grafana.plugins[3] | string | `"pr0ps-trackmap-panel"` |  |
| grafana.plugins[4] | string | `"grafana-piechart-panel"` |  |
| grafana.plugins[5] | string | `"vonage-status-panel"` |  |
| grafana.plugins[6] | string | `"grafana-worldmap-panel"` |  |
| grafana.serviceAccount.annotations."iam.gke.io/gcp-service-account" | string | `"grafana-gke-sa@prod-apps-project.iam.gserviceaccount.com"` |  |
| grafana.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| oauth2.config.existingSecret | string | `"grafana-app-secret"` |  |
| oauth2.config.provider | string | `"google"` |  |
| oauth2.config.configFile | string | `"set_xauthrequest = true\nskip_auth_preflight = true\nredirect_url = \"https://grafana.theopenlane.org/oauth2/callback\"\nupstreams = [ \"http://grafana:80/\" ]\nwhitelist_domains = [ \"*.theopenlane.org\" ]\nemail_domains = [ \"*\" ]"` |  |
| oauth2.ingress.enabled | bool | `false` |  |
| oauth2.ingress.ingressClassName | string | `"gce"` |  |
| oauth2.ingress.annotations."cert-manager.io/cluster-issuer" | string | `"letsencrypt-prod"` |  |
| oauth2.ingress.annotations."external-dns.alpha.kubernetes.io/hostname" | string | `"grafana.theopenlane.org"` |  |
| oauth2.ingress.hosts[0] | string | `"grafana.theopenlane.org"` |  |
| oauth2.ingress.tls[0].hosts[0] | string | `"grafana.theopenlane.org"` |  |
| oauth2.ingress.tls[0].secretName | string | `"grafana-tls"` |  |

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
