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
| https://charts.external-secrets.io | eso(external-secrets) | 0.17.0 |

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
| global.nodeSelector | object | `{}` |  |
| global.tolerations | list | `[]` |  |
| global.topologySpreadConstraints | list | `[]` |  |
| global.affinity | object | `{}` |  |
| global.compatibility.openshift.adaptSecurityContext | string | `"auto"` | Manages the securityContext properties to make them compatible with OpenShift. Possible values: auto - Apply configurations if it is detected that OpenShift is the target platform. force - Always apply configurations. disabled - No modification applied. |
| replicaCount | int | `1` |  |
| bitwarden-sdk-server.enabled | bool | `false` |  |
| revisionHistoryLimit | int | `10` | Specifies the amount of historic ReplicaSets k8s should keep (see https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#clean-up-policy) |
| image.repository | string | `"oci.external-secrets.io/external-secrets/external-secrets"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `""` | The image tag to use. The default is the chart appVersion. |
| image.flavour | string | `""` | The flavour of tag you want to use There are different image flavours available, like distroless and ubi. Please see GitHub release notes for image tags for these flavors. By default, the distroless image is used. |
| installCRDs | bool | `true` | If set, install and upgrade CRDs through helm chart. |
| crds.createClusterExternalSecret | bool | `true` | If true, create CRDs for Cluster External Secret. |
| crds.createClusterSecretStore | bool | `true` | If true, create CRDs for Cluster Secret Store. |
| crds.createClusterGenerator | bool | `true` | If true, create CRDs for Cluster Generator. |
| crds.createClusterPushSecret | bool | `true` | If true, create CRDs for Cluster Push Secret. |
| crds.createPushSecret | bool | `true` | If true, create CRDs for Push Secret. |
| crds.annotations | object | `{}` |  |
| crds.conversion.enabled | bool | `false` | Conversion is disabled by default as we stopped supporting v1alpha1. |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| namespaceOverride | string | `"external-secrets"` |  |
| commonLabels | object | `{}` | Additional labels added to all helm chart resources. |
| leaderElect | bool | `false` | If true, external-secrets will perform leader election between instances to ensure no more than one instance of external-secrets operates at a time. |
| controllerClass | string | `""` | If set external secrets will filter matching Secret Stores with the appropriate controller values. |
| extendedMetricLabels | bool | `false` | If true external secrets will use recommended kubernetes annotations as prometheus metric labels. |
| scopedNamespace | string | `""` | If set external secrets are only reconciled in the provided namespace |
| scopedRBAC | bool | `false` | Must be used with scopedNamespace. If true, create scoped RBAC roles under the scoped namespace and implicitly disable cluster stores and cluster external secrets |
| openshiftFinalizers | bool | `false` | If true the OpenShift finalizer permissions will be added to RBAC |
| processClusterExternalSecret | bool | `true` | if true, the operator will process cluster external secret. Else, it will ignore them. |
| processClusterPushSecret | bool | `true` | if true, the operator will process cluster push secret. Else, it will ignore them. |
| processClusterStore | bool | `true` | if true, the operator will process cluster store. Else, it will ignore them. |
| processPushSecret | bool | `true` | if true, the operator will process push secret. Else, it will ignore them. |
| createOperator | bool | `true` | Specifies whether an external secret operator deployment be created. |
| concurrent | int | `1` | Specifies the number of concurrent ExternalSecret Reconciles external-secret executes at a time. |
| log | object | `{"level":"info","timeEncoding":"epoch"}` | Specifices Log Params to the External Secrets Operator |
| service.ipFamilyPolicy | string | `""` | Set the ip family policy to configure dual-stack see [Configure dual-stack](https://kubernetes.io/docs/concepts/services-networking/dual-stack/#services) |
| service.ipFamilies | list | `[]` | Sets the families that should be supported and the order in which they should be applied to ClusterIP as well. Can be IPv4 and/or IPv6. |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created. |
| serviceAccount.automount | bool | `true` | Automounts the service account token in all containers of the pod |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.extraLabels | object | `{}` | Extra Labels to add to the service account. |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |
| rbac.create | bool | `true` | Specifies whether role and rolebinding resources should be created. |
| rbac.servicebindings.create | bool | `true` | Specifies whether a clusterrole to give servicebindings read access should be created. |
| rbac.aggregateToView | bool | `true` | Specifies whether permissions are aggregated to the view ClusterRole |
| rbac.aggregateToEdit | bool | `true` | Specifies whether permissions are aggregated to the edit ClusterRole |
| extraEnv | list | `[]` |  |
| extraArgs | object | `{}` |  |
| extraVolumes | list | `[]` |  |
| extraObjects | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraContainers | list | `[]` |  |
| deploymentAnnotations | object | `{}` | Annotations to add to Deployment |
| podAnnotations | object | `{}` | Annotations to add to Pod |
| podLabels | object | `{}` |  |
| podSecurityContext.enabled | bool | `true` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.enabled | bool | `true` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| resources | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` | Specifies whether to create a ServiceMonitor resource for collecting Prometheus metrics |
| serviceMonitor.namespace | string | `""` | namespace where you want to install ServiceMonitors |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels |
| serviceMonitor.interval | string | `"30s"` | Interval to scrape metrics |
| serviceMonitor.scrapeTimeout | string | `"25s"` | Timeout if metrics can't be retrieved in given time interval |
| serviceMonitor.honorLabels | bool | `false` | Let prometheus add an exported_ prefix to conflicting labels |
| serviceMonitor.metricRelabelings | list | `[]` | Metric relabel configs to apply to samples before ingestion. [Metric Relabeling](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#metric_relabel_configs) |
| serviceMonitor.relabelings | list | `[]` | Relabel configs to apply to samples before ingestion. [Relabeling](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#relabel_config) |
| metrics.listen.port | int | `8080` |  |
| metrics.service.enabled | bool | `false` | Enable if you use another monitoring tool than Prometheus to scrape the metrics |
| metrics.service.port | int | `8080` | Metrics service port to scrape |
| metrics.service.annotations | object | `{}` | Additional service annotations |
| grafanaDashboard.enabled | bool | `false` | If true creates a Grafana dashboard. |
| grafanaDashboard.sidecarLabel | string | `"grafana_dashboard"` | Label that ConfigMaps should have to be loaded as dashboards. |
| grafanaDashboard.sidecarLabelValue | string | `"1"` | Label value that ConfigMaps should have to be loaded as dashboards. |
| grafanaDashboard.annotations | object | `{}` | Annotations that ConfigMaps can have to get configured in Grafana, See: sidecar.dashboards.folderAnnotation for specifying the dashboard folder. https://github.com/grafana/helm-charts/tree/main/charts/grafana |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| affinity | object | `{}` |  |
| priorityClassName | string | `""` | Pod priority class name. |
| podDisruptionBudget | object | `{"enabled":false,"minAvailable":1}` | Pod disruption budget - for more details see https://kubernetes.io/docs/concepts/workloads/pods/disruptions/ |
| hostNetwork | bool | `false` | Run the controller on the host network |
| webhook.annotations | object | `{}` | Annotations to place on validating webhook configuration. |
| webhook.create | bool | `true` | Specifies whether a webhook deployment be created. If set to false, crds.conversion.enabled should also be set to false otherwise the kubeapi will be hammered because the conversion is looking for a webhook endpoint. |
| webhook.certCheckInterval | string | `"5m"` | Specifices the time to check if the cert is valid |
| webhook.lookaheadInterval | string | `""` | Specifices the lookaheadInterval for certificate validity |
| webhook.replicaCount | int | `1` |  |
| webhook.log | object | `{"level":"info","timeEncoding":"epoch"}` | Specifices Log Params to the Webhook |
| webhook.revisionHistoryLimit | int | `10` | Specifies the amount of historic ReplicaSets k8s should keep (see https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#clean-up-policy) |
| webhook.certDir | string | `"/tmp/certs"` |  |
| webhook.failurePolicy | string | `"Fail"` | Specifies whether validating webhooks should be created with failurePolicy: Fail or Ignore |
| webhook.hostNetwork | bool | `false` | Specifies if webhook pod should use hostNetwork or not. |
| webhook.image.repository | string | `"oci.external-secrets.io/external-secrets/external-secrets"` |  |
| webhook.image.pullPolicy | string | `"IfNotPresent"` |  |
| webhook.image.tag | string | `""` | The image tag to use. The default is the chart appVersion. |
| webhook.image.flavour | string | `""` | The flavour of tag you want to use |
| webhook.imagePullSecrets | list | `[]` |  |
| webhook.nameOverride | string | `""` |  |
| webhook.fullnameOverride | string | `""` |  |
| webhook.port | int | `10250` | The port the webhook will listen to |
| webhook.rbac.create | bool | `true` | Specifies whether role and rolebinding resources should be created. |
| webhook.serviceAccount.create | bool | `true` | Specifies whether a service account should be created. |
| webhook.serviceAccount.automount | bool | `true` | Automounts the service account token in all containers of the pod |
| webhook.serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| webhook.serviceAccount.extraLabels | object | `{}` | Extra Labels to add to the service account. |
| webhook.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |
| webhook.nodeSelector | object | `{}` |  |
| webhook.certManager.enabled | bool | `false` | Enabling cert-manager support will disable the built in secret and switch to using cert-manager (installed separately) to automatically issue and renew the webhook certificate. This chart does not install cert-manager for you, See https://cert-manager.io/docs/ |
| webhook.certManager.addInjectorAnnotations | bool | `true` | Automatically add the cert-manager.io/inject-ca-from annotation to the webhooks and CRDs. As long as you have the cert-manager CA Injector enabled, this will automatically setup your webhook's CA to the one used by cert-manager. See https://cert-manager.io/docs/concepts/ca-injector |
| webhook.certManager.cert.create | bool | `true` | Create a certificate resource within this chart. See https://cert-manager.io/docs/usage/certificate/ |
| webhook.certManager.cert.issuerRef | object | `{"group":"cert-manager.io","kind":"Issuer","name":"my-issuer"}` | For the Certificate created by this chart, setup the issuer. See https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.IssuerSpec |
| webhook.certManager.cert.duration | string | `"8760h"` | Set the requested duration (i.e. lifetime) of the Certificate. See https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.CertificateSpec One year by default. |
| webhook.certManager.cert.revisionHistoryLimit | int | `0` | Set the revisionHistoryLimit on the Certificate. See https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.CertificateSpec Defaults to 0 (ignored). |
| webhook.certManager.cert.renewBefore | string | `""` | How long before the currently issued certificate’s expiry cert-manager should renew the certificate. See https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.CertificateSpec Note that renewBefore should be greater than .webhook.lookaheadInterval since the webhook will check this far in advance that the certificate is valid. |
| webhook.certManager.cert.annotations | object | `{}` | Add extra annotations to the Certificate resource. |
| webhook.tolerations | list | `[]` |  |
| webhook.topologySpreadConstraints | list | `[]` |  |
| webhook.affinity | object | `{}` |  |
| webhook.priorityClassName | string | `""` | Pod priority class name. |
| webhook.podDisruptionBudget | object | `{"enabled":false,"minAvailable":1}` | Pod disruption budget - for more details see https://kubernetes.io/docs/concepts/workloads/pods/disruptions/ |
| webhook.metrics.listen.port | int | `8080` |  |
| webhook.metrics.service.enabled | bool | `false` | Enable if you use another monitoring tool than Prometheus to scrape the metrics |
| webhook.metrics.service.port | int | `8080` | Metrics service port to scrape |
| webhook.metrics.service.annotations | object | `{}` | Additional service annotations |
| webhook.readinessProbe.address | string | `""` | Address for readiness probe |
| webhook.readinessProbe.port | int | `8081` | ReadinessProbe port for kubelet |
| webhook.extraEnv | list | `[]` |  |
| webhook.extraArgs | object | `{}` |  |
| webhook.extraVolumes | list | `[]` |  |
| webhook.extraVolumeMounts | list | `[]` |  |
| webhook.secretAnnotations | object | `{}` | Annotations to add to Secret |
| webhook.deploymentAnnotations | object | `{}` | Annotations to add to Deployment |
| webhook.podAnnotations | object | `{}` | Annotations to add to Pod |
| webhook.podLabels | object | `{}` |  |
| webhook.podSecurityContext.enabled | bool | `true` |  |
| webhook.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| webhook.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| webhook.securityContext.enabled | bool | `true` |  |
| webhook.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| webhook.securityContext.runAsNonRoot | bool | `true` |  |
| webhook.securityContext.runAsUser | int | `1000` |  |
| webhook.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| webhook.resources | object | `{}` |  |
| webhook.service | object | `{"annotations":{},"enabled":true,"labels":{},"loadBalancerIP":"","type":"ClusterIP"}` | Manage the service through which the webhook is reached. |
| webhook.service.enabled | bool | `true` | Whether the service object should be enabled or not (it is expected to exist). |
| webhook.service.annotations | object | `{}` | Custom annotations for the webhook service. |
| webhook.service.labels | object | `{}` | Custom labels for the webhook service. |
| webhook.service.type | string | `"ClusterIP"` | The service type of the webhook service. |
| webhook.service.loadBalancerIP | string | `""` | If the webhook service type is LoadBalancer, you can assign a specific load balancer IP here. Check the documentation of your load balancer provider to see if/how this should be used. |
| certController.create | bool | `true` | Specifies whether a certificate controller deployment be created. |
| certController.requeueInterval | string | `"5m"` |  |
| certController.replicaCount | int | `1` |  |
| certController.log | object | `{"level":"info","timeEncoding":"epoch"}` | Specifices Log Params to the Certificate Controller |
| certController.revisionHistoryLimit | int | `10` | Specifies the amount of historic ReplicaSets k8s should keep (see https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#clean-up-policy) |
| certController.image.repository | string | `"oci.external-secrets.io/external-secrets/external-secrets"` |  |
| certController.image.pullPolicy | string | `"IfNotPresent"` |  |
| certController.image.tag | string | `""` |  |
| certController.image.flavour | string | `""` |  |
| certController.imagePullSecrets | list | `[]` |  |
| certController.nameOverride | string | `""` |  |
| certController.fullnameOverride | string | `""` |  |
| certController.rbac.create | bool | `true` | Specifies whether role and rolebinding resources should be created. |
| certController.serviceAccount.create | bool | `true` | Specifies whether a service account should be created. |
| certController.serviceAccount.automount | bool | `true` | Automounts the service account token in all containers of the pod |
| certController.serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| certController.serviceAccount.extraLabels | object | `{}` | Extra Labels to add to the service account. |
| certController.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |
| certController.nodeSelector | object | `{}` |  |
| certController.tolerations | list | `[]` |  |
| certController.topologySpreadConstraints | list | `[]` |  |
| certController.affinity | object | `{}` |  |
| certController.hostNetwork | bool | `false` | Run the certController on the host network |
| certController.priorityClassName | string | `""` | Pod priority class name. |
| certController.podDisruptionBudget | object | `{"enabled":false,"minAvailable":1}` | Pod disruption budget - for more details see https://kubernetes.io/docs/concepts/workloads/pods/disruptions/ |
| certController.metrics.listen.port | int | `8080` |  |
| certController.metrics.service.enabled | bool | `false` | Enable if you use another monitoring tool than Prometheus to scrape the metrics |
| certController.metrics.service.port | int | `8080` | Metrics service port to scrape |
| certController.metrics.service.annotations | object | `{}` | Additional service annotations |
| certController.readinessProbe.address | string | `""` | Address for readiness probe |
| certController.readinessProbe.port | int | `8081` | ReadinessProbe port for kubelet |
| certController.extraEnv | list | `[]` |  |
| certController.extraArgs | object | `{}` |  |
| certController.extraVolumes | list | `[]` |  |
| certController.extraVolumeMounts | list | `[]` |  |
| certController.deploymentAnnotations | object | `{}` | Annotations to add to Deployment |
| certController.podAnnotations | object | `{}` | Annotations to add to Pod |
| certController.podLabels | object | `{}` |  |
| certController.podSecurityContext.enabled | bool | `true` |  |
| certController.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| certController.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| certController.securityContext.enabled | bool | `true` |  |
| certController.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| certController.securityContext.runAsNonRoot | bool | `true` |  |
| certController.securityContext.runAsUser | int | `1000` |  |
| certController.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| certController.resources | object | `{}` |  |
| dnsPolicy | string | `"ClusterFirst"` | Specifies `dnsPolicy` to deployment |
| dnsConfig | object | `{}` | Specifies `dnsOptions` to deployment |
| podSpecExtra | object | `{}` | Any extra pod spec on the deployment |

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
