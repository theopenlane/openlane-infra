# openlane-external-dns

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
| https://kubernetes-sigs.github.io/external-dns | external-dns | 1.19.0 |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

Deploys external-dns and its monitoring

## Source Code

* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| external-dns.global.imagePullSecrets | list | `[]` | Global image pull secrets. |
| external-dns.image.repository | string | `"registry.k8s.io/external-dns/external-dns"` | Image repository for the `external-dns` container. |
| external-dns.image.tag | string | `nil` | Image tag for the `external-dns` container, this will default to `.Chart.AppVersion` if not set. |
| external-dns.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the `external-dns` container. |
| external-dns.imagePullSecrets | list | `[]` | Image pull secrets. |
| external-dns.nameOverride | string | `nil` | Override the name of the chart. |
| external-dns.fullnameOverride | string | `nil` | Override the full name of the chart. |
| external-dns.commonLabels | object | `{}` | Labels to add to all chart resources. |
| external-dns.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount`. |
| external-dns.serviceAccount.labels | object | `{}` | Labels to add to the service account. |
| external-dns.serviceAccount.annotations | object | `{}` | Annotations to add to the service account. Templates are allowed in both the key and the value. Example: `example.com/annotation/{{ .Values.nameOverride }}: {{ .Values.nameOverride }}` |
| external-dns.serviceAccount.name | string | `"external-dns"` | If this is set and `serviceAccount.create` is `true` this will be used for the created `ServiceAccount` name, if set and `serviceAccount.create` is `false` then this will define an existing `ServiceAccount` to use. |
| external-dns.serviceAccount.automountServiceAccountToken | bool | `true` | Set this to `false` to [opt out of API credential automounting] for the `ServiceAccount`. |
| external-dns.service.annotations | object | `{}` | Service annotations. |
| external-dns.service.port | int | `7979` | Service HTTP port. |
| external-dns.service.ipFamilies | list | `[]` | Service IP families (e.g. IPv4 and/or IPv6). |
| external-dns.service.ipFamilyPolicy | string | `nil` | Service IP family policy. |
| external-dns.rbac.create | bool | `true` | If `true`, create a `ClusterRole` & `ClusterRoleBinding` with access to the Kubernetes API. |
| external-dns.rbac.additionalPermissions | list | `[]` | Additional rules to add to the `ClusterRole`. |
| external-dns.deploymentAnnotations | object | `{}` | Annotations to add to the `Deployment`. |
| external-dns.extraContainers | list | `[]` | Extra containers to add to the `Deployment`. |
| external-dns.deploymentStrategy | object | `{"type":"Recreate"}` | [Deployment Strategy](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy). |
| external-dns.revisionHistoryLimit | int | `2` | Specify the number of old `ReplicaSets` to retain to allow rollback of the `Deployment``. |
| external-dns.podLabels | object | `{}` | Labels to add to the `Pod`. |
| external-dns.podAnnotations | object | `{}` | Annotations to add to the `Pod`. |
| external-dns.automountServiceAccountToken | bool | `true` | Set this to `false` to [opt out of API credential automounting](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#opt-out-of-api-credential-automounting) for the `Pod`. |
| external-dns.shareProcessNamespace | bool | `false` | If `true`, the `Pod` will have [process namespace sharing](https://kubernetes.io/docs/tasks/configure-pod-container/share-process-namespace/) enabled. |
| external-dns.podSecurityContext | object | See _values.yaml_ | [Pod security context](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.22/#podsecuritycontext-v1-core), this supports full customisation. |
| external-dns.priorityClassName | string | `nil` | Priority class name for the `Pod`. |
| external-dns.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the `Pod` in seconds. |
| external-dns.dnsPolicy | string | `nil` | [DNS policy](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy) for the pod, if not set the default will be used. |
| external-dns.dnsConfig | object | `nil` | [DNS config](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-dns-config) for the pod, if not set the default will be used. |
| external-dns.initContainers | list | `[]` | [Init containers](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) to add to the `Pod` definition. |
| external-dns.securityContext | object | See _values.yaml_ | [Security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container) for the `external-dns` container. |
| external-dns.env | list | `[]` | [Environment variables](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) for the `external-dns` container. |
| external-dns.livenessProbe | object | See _values.yaml_ | [Liveness probe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) configuration for the `external-dns` container. |
| external-dns.readinessProbe | object | See _values.yaml_ | [Readiness probe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) configuration for the `external-dns` container. |
| external-dns.extraVolumes | list | `[]` | Extra [volumes](https://kubernetes.io/docs/concepts/storage/volumes/) for the `Pod`. |
| external-dns.extraVolumeMounts | list | `[]` | Extra [volume mounts](https://kubernetes.io/docs/concepts/storage/volumes/) for the `external-dns` container. |
| external-dns.resources | object | `{}` | [Resources](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) for the `external-dns` container. |
| external-dns.nodeSelector | object | `{}` | Node labels to match for `Pod` [scheduling](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/). |
| external-dns.affinity | object | `{}` | Affinity settings for `Pod` [scheduling](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/). If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| external-dns.topologySpreadConstraints | list | `[]` | Topology spread constraints for `Pod` [scheduling](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/). If an explicit label selector is not provided one will be created from the pod selector labels. |
| external-dns.tolerations | list | `[]` | Node taints which will be tolerated for `Pod` [scheduling](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/). |
| external-dns.serviceMonitor.enabled | bool | `false` | If `true`, create a `ServiceMonitor` resource to support the _Prometheus Operator_. |
| external-dns.serviceMonitor.additionalLabels | object | `{}` | Additional labels for the `ServiceMonitor`. |
| external-dns.serviceMonitor.annotations | object | `{}` | Annotations to add to the `ServiceMonitor`. |
| external-dns.serviceMonitor.namespace | string | `nil` | If set create the `ServiceMonitor` in an alternate namespace. |
| external-dns.serviceMonitor.interval | string | `nil` | If set override the _Prometheus_ default interval. |
| external-dns.serviceMonitor.scrapeTimeout | string | `nil` | If set override the _Prometheus_ default scrape timeout. |
| external-dns.serviceMonitor.scheme | string | `nil` | If set overrides the _Prometheus_ default scheme. |
| external-dns.serviceMonitor.tlsConfig | object | `{}` | Configure the `ServiceMonitor` [TLS config](https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#tlsconfig). |
| external-dns.serviceMonitor.bearerTokenFile | string | `nil` | Provide a bearer token file for the `ServiceMonitor`. |
| external-dns.serviceMonitor.relabelings | list | `[]` | [Relabel configs](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#relabel_config) to apply to samples before ingestion. |
| external-dns.serviceMonitor.metricRelabelings | list | `[]` | [Metric relabel configs](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#metric_relabel_configs) to apply to samples before ingestion. |
| external-dns.serviceMonitor.targetLabels | list | `[]` | Provide target labels for the `ServiceMonitor`. |
| external-dns.logLevel | string | `"info"` | Log level. |
| external-dns.logFormat | string | `"json"` | Log format. |
| external-dns.interval | string | `"1m"` | Interval for DNS updates. |
| external-dns.triggerLoopOnEvent | bool | `false` | If `true`, triggers run loop on create/update/delete events in addition of regular interval. |
| external-dns.namespaced | bool | `false` | if `true`, _ExternalDNS_ will run in a namespaced scope (`Role`` and `Rolebinding`` will be namespaced too). |
| external-dns.sources | list | `["service","ingress","gateway-httproute"]` | _Kubernetes_ resources to monitor for DNS entries. |
| external-dns.policy | string | `"upsert-only"` | How DNS records are synchronized between sources and providers; available values are `sync` & `upsert-only`. |
| external-dns.registry | string | `"txt"` | Specify the registry for storing ownership and labels. Valid values are `txt`, `aws-sd`, `dynamodb` & `noop`. |
| external-dns.txtOwnerId | string | `"external-dns"` | Specify an identifier for this instance of _ExternalDNS_ wWhen using a registry other than `noop`. |
| external-dns.txtPrefix | string | `nil` | Specify a prefix for the domain names of TXT records created for the `txt` registry.  Mutually exclusive with `txtSuffix`. |
| external-dns.txtSuffix | string | `nil` | Specify a suffix for the domain names of TXT records created for the `txt` registry.  Mutually exclusive with `txtPrefix`. |
| external-dns.domainFilters | list | `["theopenlane.org"]` | Limit possible target zones by domain suffixes. |
| external-dns.excludeDomains | list | `[]` | Intentionally exclude domains from being managed. |
| external-dns.labelFilter | string | `nil` | Filter resources queried for endpoints by label selector |
| external-dns.managedRecordTypes | list | `[]` | Record types to manage (default: A, AAAA, CNAME) |
| external-dns.provider.name | string | `"google"` | _ExternalDNS_ provider name; for the available providers and how to configure them see [README](https://github.com/kubernetes-sigs/external-dns/blob/master/charts/external-dns/README.md#providers). |
| external-dns.provider.webhook.image.repository | string | `nil` | Image repository for the `webhook` container. |
| external-dns.provider.webhook.image.tag | string | `nil` | Image tag for the `webhook` container. |
| external-dns.provider.webhook.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the `webhook` container. |
| external-dns.provider.webhook.env | list | `[]` | [Environment variables](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/) for the `webhook` container. |
| external-dns.provider.webhook.args | list | `[]` | Extra arguments to provide for the `webhook` container. |
| external-dns.provider.webhook.extraVolumeMounts | list | `[]` | Extra [volume mounts](https://kubernetes.io/docs/concepts/storage/volumes/) for the `webhook` container. |
| external-dns.provider.webhook.resources | object | `{}` | [Resources](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) for the `webhook` container. |
| external-dns.provider.webhook.securityContext | object | See _values.yaml_ | [Pod security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container) for the `webhook` container. |
| external-dns.provider.webhook.livenessProbe | object | See _values.yaml_ | [Liveness probe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) configuration for the `external-dns` container. |
| external-dns.provider.webhook.readinessProbe | object | See _values.yaml_ | [Readiness probe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/) configuration for the `webhook` container. |
| external-dns.provider.webhook.service.port | int | `8080` | Webhook exposed HTTP port for the service. |
| external-dns.provider.webhook.serviceMonitor | object | See _values.yaml_ | Optional [Service Monitor](https://prometheus-operator.dev/docs/operator/design/#servicemonitor) configuration for the `webhook` container. |
| external-dns.extraArgs | list | `[]` | Extra arguments to provide to _ExternalDNS_. |
| external-dns.secretConfiguration.enabled | bool | `false` | If `true`, create a `Secret` to store sensitive provider configuration (**DEPRECATED**). |
| external-dns.secretConfiguration.mountPath | string | `nil` | Mount path for the `Secret`, this can be templated. |
| external-dns.secretConfiguration.subPath | string | `nil` | Sub-path for mounting the `Secret`, this can be templated. |
| external-dns.secretConfiguration.data | object | `{}` | `Secret` data. |
| external-dns.enabled | bool | `nil` | No effect - reserved for use in sub-charting. |

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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-external-dns --config /charts/charts/openlane-external-dns/ct.yaml
```
