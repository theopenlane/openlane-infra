![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

# openlane-cert-manager

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
| https://charts.jetstack.io | cert-manager | v1.18.0 |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

A Helm chart to deploy cert-manager on GKE clusters using Config Connector for Openlane

## Source Code

* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cert-manager.global.imagePullSecrets | list | `[]` |  |
| cert-manager.global.commonLabels | object | `{}` |  |
| cert-manager.global.priorityClassName | string | `""` |  |
| cert-manager.global.rbac.create | bool | `true` |  |
| cert-manager.global.rbac.aggregateClusterRoles | bool | `true` |  |
| cert-manager.global.rbac.disableHTTPChallengesRole | bool | `false` |  |
| cert-manager.global.podSecurityPolicy.enabled | bool | `false` |  |
| cert-manager.global.podSecurityPolicy.useAppArmor | bool | `true` |  |
| cert-manager.global.logLevel | int | `2` |  |
| cert-manager.global.leaderElection.namespace | string | `"cert-manager"` |  |
| cert-manager.installCRDs | bool | `false` |  |
| cert-manager.crds.enabled | bool | `true` |  |
| cert-manager.crds.keep | bool | `true` |  |
| cert-manager.replicaCount | int | `1` |  |
| cert-manager.strategy | object | `{}` |  |
| cert-manager.podDisruptionBudget.enabled | bool | `false` |  |
| cert-manager.featureGates | string | `""` |  |
| cert-manager.maxConcurrentChallenges | int | `60` |  |
| cert-manager.image.repository | string | `"quay.io/jetstack/cert-manager-controller"` |  |
| cert-manager.image.pullPolicy | string | `"IfNotPresent"` |  |
| cert-manager.clusterResourceNamespace | string | `""` |  |
| cert-manager.namespace | string | `"cert-manager"` |  |
| cert-manager.serviceAccount.create | bool | `true` |  |
| cert-manager.serviceAccount.name | string | `"cert-manager"` |  |
| cert-manager.serviceAccount.annotations."iam.gke.io/gcp-service-account" | string | `"dns01-solver@prod-apps-project.iam.gserviceaccount.com"` |  |
| cert-manager.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| cert-manager.enableCertificateOwnerRef | bool | `false` |  |
| cert-manager.config | object | `{}` |  |
| cert-manager.dns01RecursiveNameservers | string | `""` |  |
| cert-manager.dns01RecursiveNameserversOnly | bool | `false` |  |
| cert-manager.disableAutoApproval | bool | `false` |  |
| cert-manager.approveSignerNames[0] | string | `"issuers.cert-manager.io/*"` |  |
| cert-manager.approveSignerNames[1] | string | `"clusterissuers.cert-manager.io/*"` |  |
| cert-manager.extraArgs | list | `[]` |  |
| cert-manager.extraEnv | list | `[]` |  |
| cert-manager.resources | object | `{}` |  |
| cert-manager.securityContext.runAsNonRoot | bool | `true` |  |
| cert-manager.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| cert-manager.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| cert-manager.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| cert-manager.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| cert-manager.volumes | list | `[]` |  |
| cert-manager.volumeMounts | list | `[]` |  |
| cert-manager.podLabels | object | `{}` |  |
| cert-manager.hostAliases | list | `[]` |  |
| cert-manager.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| cert-manager.ingressShim | object | `{}` |  |
| cert-manager.affinity | object | `{}` |  |
| cert-manager.tolerations | list | `[]` |  |
| cert-manager.topologySpreadConstraints | list | `[]` |  |
| cert-manager.livenessProbe.enabled | bool | `true` |  |
| cert-manager.livenessProbe.initialDelaySeconds | int | `10` |  |
| cert-manager.livenessProbe.periodSeconds | int | `10` |  |
| cert-manager.livenessProbe.timeoutSeconds | int | `15` |  |
| cert-manager.livenessProbe.successThreshold | int | `1` |  |
| cert-manager.livenessProbe.failureThreshold | int | `8` |  |
| cert-manager.enableServiceLinks | bool | `false` |  |
| cert-manager.prometheus.enabled | bool | `true` |  |
| cert-manager.prometheus.servicemonitor.enabled | bool | `false` |  |
| cert-manager.prometheus.servicemonitor.prometheusInstance | string | `"default"` |  |
| cert-manager.prometheus.servicemonitor.targetPort | string | `"http-metrics"` |  |
| cert-manager.prometheus.servicemonitor.path | string | `"/metrics"` |  |
| cert-manager.prometheus.servicemonitor.interval | string | `"60s"` |  |
| cert-manager.prometheus.servicemonitor.scrapeTimeout | string | `"30s"` |  |
| cert-manager.prometheus.servicemonitor.labels | object | `{}` |  |
| cert-manager.prometheus.servicemonitor.annotations | object | `{}` |  |
| cert-manager.prometheus.servicemonitor.honorLabels | bool | `false` |  |
| cert-manager.prometheus.servicemonitor.endpointAdditionalProperties | object | `{}` |  |
| cert-manager.prometheus.podmonitor.enabled | bool | `false` |  |
| cert-manager.prometheus.podmonitor.prometheusInstance | string | `"default"` |  |
| cert-manager.prometheus.podmonitor.path | string | `"/metrics"` |  |
| cert-manager.prometheus.podmonitor.interval | string | `"60s"` |  |
| cert-manager.prometheus.podmonitor.scrapeTimeout | string | `"30s"` |  |
| cert-manager.prometheus.podmonitor.labels | object | `{}` |  |
| cert-manager.prometheus.podmonitor.annotations | object | `{}` |  |
| cert-manager.prometheus.podmonitor.honorLabels | bool | `false` |  |
| cert-manager.prometheus.podmonitor.endpointAdditionalProperties | object | `{}` |  |
| cert-manager.webhook.replicaCount | int | `1` |  |
| cert-manager.webhook.timeoutSeconds | int | `30` |  |
| cert-manager.webhook.config | object | `{}` |  |
| cert-manager.webhook.strategy | object | `{}` |  |
| cert-manager.webhook.securityContext.runAsNonRoot | bool | `true` |  |
| cert-manager.webhook.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| cert-manager.webhook.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| cert-manager.webhook.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| cert-manager.webhook.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| cert-manager.webhook.podDisruptionBudget.enabled | bool | `false` |  |
| cert-manager.webhook.validatingWebhookConfiguration.namespaceSelector.matchExpressions[0].key | string | `"cert-manager.io/disable-validation"` |  |
| cert-manager.webhook.validatingWebhookConfiguration.namespaceSelector.matchExpressions[0].operator | string | `"NotIn"` |  |
| cert-manager.webhook.validatingWebhookConfiguration.namespaceSelector.matchExpressions[0].values[0] | string | `"true"` |  |
| cert-manager.webhook.mutatingWebhookConfiguration.namespaceSelector | object | `{}` |  |
| cert-manager.webhook.extraArgs | list | `[]` |  |
| cert-manager.webhook.extraEnv | list | `[]` |  |
| cert-manager.webhook.featureGates | string | `""` |  |
| cert-manager.webhook.resources | object | `{}` |  |
| cert-manager.webhook.livenessProbe.failureThreshold | int | `3` |  |
| cert-manager.webhook.livenessProbe.initialDelaySeconds | int | `60` |  |
| cert-manager.webhook.livenessProbe.periodSeconds | int | `10` |  |
| cert-manager.webhook.livenessProbe.successThreshold | int | `1` |  |
| cert-manager.webhook.livenessProbe.timeoutSeconds | int | `1` |  |
| cert-manager.webhook.readinessProbe.failureThreshold | int | `3` |  |
| cert-manager.webhook.readinessProbe.initialDelaySeconds | int | `5` |  |
| cert-manager.webhook.readinessProbe.periodSeconds | int | `5` |  |
| cert-manager.webhook.readinessProbe.successThreshold | int | `1` |  |
| cert-manager.webhook.readinessProbe.timeoutSeconds | int | `1` |  |
| cert-manager.webhook.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| cert-manager.webhook.affinity | object | `{}` |  |
| cert-manager.webhook.tolerations | list | `[]` |  |
| cert-manager.webhook.topologySpreadConstraints | list | `[]` |  |
| cert-manager.webhook.podLabels | object | `{}` |  |
| cert-manager.webhook.serviceLabels | object | `{}` |  |
| cert-manager.webhook.serviceIPFamilyPolicy | string | `""` |  |
| cert-manager.webhook.serviceIPFamilies | list | `[]` |  |
| cert-manager.webhook.image.repository | string | `"quay.io/jetstack/cert-manager-webhook"` |  |
| cert-manager.webhook.image.pullPolicy | string | `"IfNotPresent"` |  |
| cert-manager.webhook.serviceAccount.create | bool | `true` |  |
| cert-manager.webhook.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| cert-manager.webhook.securePort | int | `10250` |  |
| cert-manager.webhook.hostNetwork | bool | `false` |  |
| cert-manager.webhook.serviceType | string | `"ClusterIP"` |  |
| cert-manager.webhook.url | object | `{}` |  |
| cert-manager.webhook.networkPolicy.enabled | bool | `false` |  |
| cert-manager.webhook.networkPolicy.ingress[0].from[0].ipBlock.cidr | string | `"0.0.0.0/0"` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[0].port | int | `80` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[0].protocol | string | `"TCP"` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[1].port | int | `443` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[1].protocol | string | `"TCP"` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[2].port | int | `53` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[2].protocol | string | `"TCP"` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[3].port | int | `53` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[3].protocol | string | `"UDP"` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[4].port | int | `6443` |  |
| cert-manager.webhook.networkPolicy.egress[0].ports[4].protocol | string | `"TCP"` |  |
| cert-manager.webhook.networkPolicy.egress[0].to[0].ipBlock.cidr | string | `"0.0.0.0/0"` |  |
| cert-manager.webhook.volumes | list | `[]` |  |
| cert-manager.webhook.volumeMounts | list | `[]` |  |
| cert-manager.webhook.enableServiceLinks | bool | `false` |  |
| cert-manager.cainjector.enabled | bool | `true` |  |
| cert-manager.cainjector.replicaCount | int | `1` |  |
| cert-manager.cainjector.config | object | `{}` |  |
| cert-manager.cainjector.strategy | object | `{}` |  |
| cert-manager.cainjector.securityContext.runAsNonRoot | bool | `true` |  |
| cert-manager.cainjector.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| cert-manager.cainjector.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| cert-manager.cainjector.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| cert-manager.cainjector.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| cert-manager.cainjector.podDisruptionBudget.enabled | bool | `false` |  |
| cert-manager.cainjector.extraArgs | list | `[]` |  |
| cert-manager.cainjector.extraEnv | list | `[]` |  |
| cert-manager.cainjector.featureGates | string | `""` |  |
| cert-manager.cainjector.resources | object | `{}` |  |
| cert-manager.cainjector.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| cert-manager.cainjector.affinity | object | `{}` |  |
| cert-manager.cainjector.tolerations | list | `[]` |  |
| cert-manager.cainjector.topologySpreadConstraints | list | `[]` |  |
| cert-manager.cainjector.podLabels | object | `{}` |  |
| cert-manager.cainjector.serviceLabels | object | `{}` |  |
| cert-manager.cainjector.image.repository | string | `"quay.io/jetstack/cert-manager-cainjector"` |  |
| cert-manager.cainjector.image.pullPolicy | string | `"IfNotPresent"` |  |
| cert-manager.cainjector.serviceAccount.create | bool | `true` |  |
| cert-manager.cainjector.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| cert-manager.cainjector.volumes | list | `[]` |  |
| cert-manager.cainjector.volumeMounts | list | `[]` |  |
| cert-manager.cainjector.enableServiceLinks | bool | `false` |  |
| cert-manager.acmesolver.image.repository | string | `"quay.io/jetstack/cert-manager-acmesolver"` |  |
| cert-manager.acmesolver.image.pullPolicy | string | `"IfNotPresent"` |  |
| cert-manager.startupapicheck.enabled | bool | `false` |  |
| cert-manager.startupapicheck.securityContext.runAsNonRoot | bool | `true` |  |
| cert-manager.startupapicheck.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| cert-manager.startupapicheck.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| cert-manager.startupapicheck.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| cert-manager.startupapicheck.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| cert-manager.startupapicheck.timeout | string | `"1m"` |  |
| cert-manager.startupapicheck.backoffLimit | int | `4` |  |
| cert-manager.startupapicheck.jobAnnotations."helm.sh/hook" | string | `"post-install"` |  |
| cert-manager.startupapicheck.jobAnnotations."helm.sh/hook-weight" | string | `"1"` |  |
| cert-manager.startupapicheck.jobAnnotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation,hook-succeeded"` |  |
| cert-manager.startupapicheck.extraArgs[0] | string | `"-v"` |  |
| cert-manager.startupapicheck.extraEnv | list | `[]` |  |
| cert-manager.startupapicheck.resources | object | `{}` |  |
| cert-manager.startupapicheck.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| cert-manager.startupapicheck.affinity | object | `{}` |  |
| cert-manager.startupapicheck.tolerations | list | `[]` |  |
| cert-manager.startupapicheck.podLabels | object | `{}` |  |
| cert-manager.startupapicheck.image.repository | string | `"quay.io/jetstack/cert-manager-startupapicheck"` |  |
| cert-manager.startupapicheck.image.pullPolicy | string | `"IfNotPresent"` |  |
| cert-manager.startupapicheck.rbac.annotations."helm.sh/hook" | string | `"post-install"` |  |
| cert-manager.startupapicheck.rbac.annotations."helm.sh/hook-weight" | string | `"-5"` |  |
| cert-manager.startupapicheck.rbac.annotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation,hook-succeeded"` |  |
| cert-manager.startupapicheck.serviceAccount.create | bool | `true` |  |
| cert-manager.startupapicheck.serviceAccount.annotations."helm.sh/hook" | string | `"post-install"` |  |
| cert-manager.startupapicheck.serviceAccount.annotations."helm.sh/hook-weight" | string | `"-5"` |  |
| cert-manager.startupapicheck.serviceAccount.annotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation,hook-succeeded"` |  |
| cert-manager.startupapicheck.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| cert-manager.startupapicheck.volumes | list | `[]` |  |
| cert-manager.startupapicheck.volumeMounts | list | `[]` |  |
| cert-manager.startupapicheck.enableServiceLinks | bool | `false` |  |
| cert-manager.extraObjects | list | `[]` |  |
| cert-manager.creator | string | `"helm"` |  |
| cert-manager.enabled | bool | `true` |  |

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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-cert-manager --config /charts/charts/openlane-cert-manager/ct.yaml
```
