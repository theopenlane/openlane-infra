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
| https://charts.jetstack.io | certmanager(cert-manager) | v1.17.2 |
| https://theopenlane.github.io/openlane-infra | iamPolicyMembers(openlane-gcp-iam-policy-members) | 0.1.0 |
| https://theopenlane.github.io/openlane-infra | workloadIdentity(openlane-gcp-workload-identity) | 0.1.0 |

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
| global.gcpProjectId | string | `"prod-apps-project"` | Google Project ID of the Kubernetes Cluster hosting the service Account |
| global.cnrmNamespace | string | `"config-control"` | Allows to deploy in another namespace than the release one |
| global.abandon | bool | `false` | Activate abandon of the resources (If true, the GCP resources will be keep after deleting k8s resources) |
| grafanaDashboard.enabled | bool | `true` | Add grafana dashboard as a configmap |
| grafanaDashboard.label | object | `{"grafana_dashboard":"1"}` | label to apply to the config map. Used by Grafana sidecar to automatically install the dashboard |
| certmanager.global.imagePullSecrets | list | `[]` |  |
| certmanager.global.commonLabels | object | `{}` |  |
| certmanager.global.priorityClassName | string | `""` |  |
| certmanager.global.rbac.create | bool | `true` |  |
| certmanager.global.rbac.aggregateClusterRoles | bool | `true` |  |
| certmanager.global.podSecurityPolicy.enabled | bool | `false` |  |
| certmanager.global.podSecurityPolicy.useAppArmor | bool | `true` |  |
| certmanager.global.logLevel | int | `2` |  |
| certmanager.global.leaderElection.namespace | string | `"kube-system"` |  |
| certmanager.installCRDs | bool | `true` |  |
| certmanager.crds.enabled | bool | `true` |  |
| certmanager.crds.keep | bool | `true` |  |
| certmanager.replicaCount | int | `1` |  |
| certmanager.strategy | object | `{}` |  |
| certmanager.podDisruptionBudget.enabled | bool | `false` |  |
| certmanager.featureGates | string | `""` |  |
| certmanager.maxConcurrentChallenges | int | `60` |  |
| certmanager.image.repository | string | `"quay.io/jetstack/cert-manager-controller"` |  |
| certmanager.image.pullPolicy | string | `"IfNotPresent"` |  |
| certmanager.clusterResourceNamespace | string | `""` |  |
| certmanager.namespace | string | `"cert-manager"` |  |
| certmanager.serviceAccount.create | bool | `true` |  |
| certmanager.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| certmanager.enableCertificateOwnerRef | bool | `false` |  |
| certmanager.config | object | `{}` |  |
| certmanager.dns01RecursiveNameservers | string | `""` |  |
| certmanager.dns01RecursiveNameserversOnly | bool | `false` |  |
| certmanager.disableAutoApproval | bool | `false` |  |
| certmanager.approveSignerNames[0] | string | `"issuers.cert-manager.io/*"` |  |
| certmanager.approveSignerNames[1] | string | `"clusterissuers.cert-manager.io/*"` |  |
| certmanager.extraArgs | list | `[]` |  |
| certmanager.extraEnv | list | `[]` |  |
| certmanager.resources | object | `{}` |  |
| certmanager.securityContext.runAsNonRoot | bool | `true` |  |
| certmanager.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| certmanager.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| certmanager.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| certmanager.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| certmanager.volumes | list | `[]` |  |
| certmanager.volumeMounts | list | `[]` |  |
| certmanager.podLabels | object | `{}` |  |
| certmanager.hostAliases | list | `[]` |  |
| certmanager.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| certmanager.ingressShim | object | `{}` |  |
| certmanager.affinity | object | `{}` |  |
| certmanager.tolerations | list | `[]` |  |
| certmanager.topologySpreadConstraints | list | `[]` |  |
| certmanager.livenessProbe.enabled | bool | `true` |  |
| certmanager.livenessProbe.initialDelaySeconds | int | `10` |  |
| certmanager.livenessProbe.periodSeconds | int | `10` |  |
| certmanager.livenessProbe.timeoutSeconds | int | `15` |  |
| certmanager.livenessProbe.successThreshold | int | `1` |  |
| certmanager.livenessProbe.failureThreshold | int | `8` |  |
| certmanager.enableServiceLinks | bool | `false` |  |
| certmanager.prometheus.enabled | bool | `true` |  |
| certmanager.prometheus.servicemonitor.enabled | bool | `true` |  |
| certmanager.prometheus.servicemonitor.prometheusInstance | string | `"default"` |  |
| certmanager.prometheus.servicemonitor.targetPort | int | `9402` |  |
| certmanager.prometheus.servicemonitor.path | string | `"/metrics"` |  |
| certmanager.prometheus.servicemonitor.interval | string | `"60s"` |  |
| certmanager.prometheus.servicemonitor.scrapeTimeout | string | `"30s"` |  |
| certmanager.prometheus.servicemonitor.labels | object | `{}` |  |
| certmanager.prometheus.servicemonitor.annotations | object | `{}` |  |
| certmanager.prometheus.servicemonitor.honorLabels | bool | `false` |  |
| certmanager.prometheus.servicemonitor.endpointAdditionalProperties | object | `{}` |  |
| certmanager.prometheus.podmonitor.enabled | bool | `false` |  |
| certmanager.prometheus.podmonitor.prometheusInstance | string | `"default"` |  |
| certmanager.prometheus.podmonitor.path | string | `"/metrics"` |  |
| certmanager.prometheus.podmonitor.interval | string | `"60s"` |  |
| certmanager.prometheus.podmonitor.scrapeTimeout | string | `"30s"` |  |
| certmanager.prometheus.podmonitor.labels | object | `{}` |  |
| certmanager.prometheus.podmonitor.annotations | object | `{}` |  |
| certmanager.prometheus.podmonitor.honorLabels | bool | `false` |  |
| certmanager.prometheus.podmonitor.endpointAdditionalProperties | object | `{}` |  |
| certmanager.webhook.replicaCount | int | `1` |  |
| certmanager.webhook.timeoutSeconds | int | `30` |  |
| certmanager.webhook.config | object | `{}` |  |
| certmanager.webhook.strategy | object | `{}` |  |
| certmanager.webhook.securityContext.runAsNonRoot | bool | `true` |  |
| certmanager.webhook.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| certmanager.webhook.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| certmanager.webhook.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| certmanager.webhook.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| certmanager.webhook.podDisruptionBudget.enabled | bool | `false` |  |
| certmanager.webhook.validatingWebhookConfiguration.namespaceSelector.matchExpressions[0].key | string | `"cert-manager.io/disable-validation"` |  |
| certmanager.webhook.validatingWebhookConfiguration.namespaceSelector.matchExpressions[0].operator | string | `"NotIn"` |  |
| certmanager.webhook.validatingWebhookConfiguration.namespaceSelector.matchExpressions[0].values[0] | string | `"true"` |  |
| certmanager.webhook.mutatingWebhookConfiguration.namespaceSelector | object | `{}` |  |
| certmanager.webhook.extraArgs | list | `[]` |  |
| certmanager.webhook.extraEnv | list | `[]` |  |
| certmanager.webhook.featureGates | string | `""` |  |
| certmanager.webhook.resources | object | `{}` |  |
| certmanager.webhook.livenessProbe.failureThreshold | int | `3` |  |
| certmanager.webhook.livenessProbe.initialDelaySeconds | int | `60` |  |
| certmanager.webhook.livenessProbe.periodSeconds | int | `10` |  |
| certmanager.webhook.livenessProbe.successThreshold | int | `1` |  |
| certmanager.webhook.livenessProbe.timeoutSeconds | int | `1` |  |
| certmanager.webhook.readinessProbe.failureThreshold | int | `3` |  |
| certmanager.webhook.readinessProbe.initialDelaySeconds | int | `5` |  |
| certmanager.webhook.readinessProbe.periodSeconds | int | `5` |  |
| certmanager.webhook.readinessProbe.successThreshold | int | `1` |  |
| certmanager.webhook.readinessProbe.timeoutSeconds | int | `1` |  |
| certmanager.webhook.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| certmanager.webhook.affinity | object | `{}` |  |
| certmanager.webhook.tolerations | list | `[]` |  |
| certmanager.webhook.topologySpreadConstraints | list | `[]` |  |
| certmanager.webhook.podLabels | object | `{}` |  |
| certmanager.webhook.serviceLabels | object | `{}` |  |
| certmanager.webhook.serviceIPFamilyPolicy | string | `""` |  |
| certmanager.webhook.serviceIPFamilies | list | `[]` |  |
| certmanager.webhook.image.repository | string | `"quay.io/jetstack/cert-manager-webhook"` |  |
| certmanager.webhook.image.pullPolicy | string | `"IfNotPresent"` |  |
| certmanager.webhook.serviceAccount.create | bool | `true` |  |
| certmanager.webhook.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| certmanager.webhook.securePort | int | `10250` |  |
| certmanager.webhook.hostNetwork | bool | `false` |  |
| certmanager.webhook.serviceType | string | `"ClusterIP"` |  |
| certmanager.webhook.url | object | `{}` |  |
| certmanager.webhook.networkPolicy.enabled | bool | `false` |  |
| certmanager.webhook.networkPolicy.ingress[0].from[0].ipBlock.cidr | string | `"0.0.0.0/0"` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[0].port | int | `80` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[0].protocol | string | `"TCP"` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[1].port | int | `443` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[1].protocol | string | `"TCP"` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[2].port | int | `53` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[2].protocol | string | `"TCP"` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[3].port | int | `53` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[3].protocol | string | `"UDP"` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[4].port | int | `6443` |  |
| certmanager.webhook.networkPolicy.egress[0].ports[4].protocol | string | `"TCP"` |  |
| certmanager.webhook.networkPolicy.egress[0].to[0].ipBlock.cidr | string | `"0.0.0.0/0"` |  |
| certmanager.webhook.volumes | list | `[]` |  |
| certmanager.webhook.volumeMounts | list | `[]` |  |
| certmanager.webhook.enableServiceLinks | bool | `false` |  |
| certmanager.cainjector.enabled | bool | `true` |  |
| certmanager.cainjector.replicaCount | int | `1` |  |
| certmanager.cainjector.config | object | `{}` |  |
| certmanager.cainjector.strategy | object | `{}` |  |
| certmanager.cainjector.securityContext.runAsNonRoot | bool | `true` |  |
| certmanager.cainjector.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| certmanager.cainjector.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| certmanager.cainjector.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| certmanager.cainjector.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| certmanager.cainjector.podDisruptionBudget.enabled | bool | `false` |  |
| certmanager.cainjector.extraArgs | list | `[]` |  |
| certmanager.cainjector.extraEnv | list | `[]` |  |
| certmanager.cainjector.featureGates | string | `""` |  |
| certmanager.cainjector.resources | object | `{}` |  |
| certmanager.cainjector.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| certmanager.cainjector.affinity | object | `{}` |  |
| certmanager.cainjector.tolerations | list | `[]` |  |
| certmanager.cainjector.topologySpreadConstraints | list | `[]` |  |
| certmanager.cainjector.podLabels | object | `{}` |  |
| certmanager.cainjector.serviceLabels | object | `{}` |  |
| certmanager.cainjector.image.repository | string | `"quay.io/jetstack/cert-manager-cainjector"` |  |
| certmanager.cainjector.image.pullPolicy | string | `"IfNotPresent"` |  |
| certmanager.cainjector.serviceAccount.create | bool | `true` |  |
| certmanager.cainjector.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| certmanager.cainjector.volumes | list | `[]` |  |
| certmanager.cainjector.volumeMounts | list | `[]` |  |
| certmanager.cainjector.enableServiceLinks | bool | `false` |  |
| certmanager.acmesolver.image.repository | string | `"quay.io/jetstack/cert-manager-acmesolver"` |  |
| certmanager.acmesolver.image.pullPolicy | string | `"IfNotPresent"` |  |
| certmanager.startupapicheck.enabled | bool | `true` |  |
| certmanager.startupapicheck.securityContext.runAsNonRoot | bool | `true` |  |
| certmanager.startupapicheck.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| certmanager.startupapicheck.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| certmanager.startupapicheck.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| certmanager.startupapicheck.containerSecurityContext.readOnlyRootFilesystem | bool | `true` |  |
| certmanager.startupapicheck.timeout | string | `"1m"` |  |
| certmanager.startupapicheck.backoffLimit | int | `4` |  |
| certmanager.startupapicheck.jobAnnotations."helm.sh/hook" | string | `"post-install"` |  |
| certmanager.startupapicheck.jobAnnotations."helm.sh/hook-weight" | string | `"1"` |  |
| certmanager.startupapicheck.jobAnnotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation,hook-succeeded"` |  |
| certmanager.startupapicheck.extraArgs[0] | string | `"-v"` |  |
| certmanager.startupapicheck.extraEnv | list | `[]` |  |
| certmanager.startupapicheck.resources | object | `{}` |  |
| certmanager.startupapicheck.nodeSelector."kubernetes.io/os" | string | `"linux"` |  |
| certmanager.startupapicheck.affinity | object | `{}` |  |
| certmanager.startupapicheck.tolerations | list | `[]` |  |
| certmanager.startupapicheck.podLabels | object | `{}` |  |
| certmanager.startupapicheck.image.repository | string | `"quay.io/jetstack/cert-manager-startupapicheck"` |  |
| certmanager.startupapicheck.image.pullPolicy | string | `"IfNotPresent"` |  |
| certmanager.startupapicheck.rbac.annotations."helm.sh/hook" | string | `"post-install"` |  |
| certmanager.startupapicheck.rbac.annotations."helm.sh/hook-weight" | string | `"-5"` |  |
| certmanager.startupapicheck.rbac.annotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation,hook-succeeded"` |  |
| certmanager.startupapicheck.serviceAccount.create | bool | `true` |  |
| certmanager.startupapicheck.serviceAccount.annotations."helm.sh/hook" | string | `"post-install"` |  |
| certmanager.startupapicheck.serviceAccount.annotations."helm.sh/hook-weight" | string | `"-5"` |  |
| certmanager.startupapicheck.serviceAccount.annotations."helm.sh/hook-delete-policy" | string | `"before-hook-creation,hook-succeeded"` |  |
| certmanager.startupapicheck.serviceAccount.automountServiceAccountToken | bool | `true` |  |
| certmanager.startupapicheck.volumes | list | `[]` |  |
| certmanager.startupapicheck.volumeMounts | list | `[]` |  |
| certmanager.startupapicheck.enableServiceLinks | bool | `false` |  |
| certmanager.extraObjects | list | `[]` |  |
| certmanager.creator | string | `"helm"` |  |
| certmanager.enabled | bool | `true` |  |
| prometheusRules.rules.enabled | bool | `false` | Enables prometheus operator rules for cert-manager |
| prometheusRules.rules.labels | object | `{"prometheus":"prometheus-operator-prometheus"}` | Labels to affect to the Prometheus Rules |
| issuers | list | Please look at the `values.yaml` file | List of issuers to create. Please read the following [documentation](https://cert-manager.io/docs/concepts/issuer/) |
| certs | list | Please look at the `values.yaml` file | Generate basic certificates |
| tags.configConnector | bool | `true` | Enables Config Connector features |
| iamPolicyMembers.members[0].name | string | `"cert-manager-gsa"` |  |
| iamPolicyMembers.members[0].member | string | `""` |  |
| iamPolicyMembers.members[0].role | string | `"roles/dns.admin"` | Roles to apply to cert-manager google service account |
| iamPolicyMembers.members[0].resourceRef.kind | string | `"Project"` |  |
| iamPolicyMembers.members[0].resourceRef.external | string | `""` |  |
| workloadIdentity.global.gsa.create | bool | `true` |  |
| workloadIdentity.global.gsa.name | string | `"wi-k8s"` |  |
| workloadIdentity.global.gsa.project | string | `""` |  |
| workloadIdentity.global.ksa.namespace | string | `"cert-manager"` |  |
| workloadIdentity.global.ksa.name | string | `"wi-k8s"` |  |

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
helm install openlane-infra/openlane-cert-manager
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-cert-manager --config /charts/charts/openlane-cert-manager/ct.yaml
```
