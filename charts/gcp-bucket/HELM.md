![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

# openlane-gcp-bucket

**Homepage:** <https://www.theopenlane.io>

## Prerequisites

- [Helm](https://helm.sh/docs/intro/install/)
- [ct](https://github.com/helm/chart-testing)
- [helm-docs](https://github.com/norwoodj/helm-docs)
- [task](https://taskfile.dev/)

Once you've installed `task` you can simply run `task install` to get the remaining dependencies installed, assuning you're using macOS and have `brew`.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> |  |

## Description

A Helm chart for creating a GCP Bucket via Config Connector

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.cnrmNamespace | string | `nil` | Allows to deploy in another namespace than the release one |
| global.abandon | bool | `true` | Abandon resource if the manifests are deleted. Allow deleting a resource from config connector without deleting it from GCP |
| global.skipUnspecifiedFields | bool | `false` | This skips populating unspecified fields into the Kubernetes resource spec. |
| global.gcpProjectId | string | `"myprojectid"` | Project ID where to deploy the cluster |
| global.description | string | `""` | subNework description (use helm tpl) |
| commonAppConfig.storage.enabled | bool | `false` |  |
| commonAppConfig.storage.location | string | `"us-east4"` |  |
| commonAppConfig.storage.cmekEnabled | bool | `false` |  |
| bucketName | string | `"myfirstbucket"` | Name of the bucket. Must be unique. |
| annotations | object | `{}` | Add annotations to this chart resources |
| accessControl | object | `{"createCloudIamPolicy":true,"iamPolicy":[{"member":"serviceAccount:sa-name@${gcpProjectId?}.iam.gserviceaccount.com","role":"roles/storage.admin"}],"publicAccessPrevention":"inherited","uniformBucketLevelAccess":false}` | Configure access control for the bucket |
| accessControl.uniformBucketLevelAccess | bool | `false` | Activate [uniform bucket-level access](https://cloud.google.com/storage/docs/uniform-bucket-level-access) |
| accessControl.publicAccessPrevention | string | `"inherited"` | The bucket's public access prevention status, which is either "inherited" or "enforced". If "inherited", the bucket uses public access prevention only if the bucket is subject to the public access prevention organization policy constraint. |
| accessControl.createCloudIamPolicy | bool | `true` | Create iam policy member for the bucket through kcc, based on the `iamPolicy` list. |
| accessControl.iamPolicy[0].member | string | `"serviceAccount:sa-name@${gcpProjectId?}.iam.gserviceaccount.com"` | An identifier for the member, which usually has the following form: member-type:id. For example, user:my-user@example.com. For a full list of the values that member can have, see the [Policy Binding reference](https://cloud.google.com/iam/docs/reference/rest/v1/Policy#Binding). |
| accessControl.iamPolicy[0].role | string | `"roles/storage.admin"` | Name of the [role](https://cloud.google.com/storage/docs/access-control/iam-roles) to apply to the bucket |
| cors | list | See the `values.yaml` for more details | The bucket's [Cross-Origin Resource Sharing](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing#:~:text=Cross%2Dorigin%20resource%20sharing%20(CORS,scripts%2C%20iframes%2C%20and%20videos.) (CORS) configuration. |
| defaultEventBasedHold | bool | `false` | Whether or not to automatically apply an [eventBasedHold](https://cloud.google.com/storage/docs/object-holds#hold-types) to new objects added to the bucket. |
| encryption.enabled | bool | `false` | Enables customer-supplied or customer-managed encryption. By default, Bucket are encrypted |
| encryption.kccControlled | bool | `false` | Specify if the KMS key was created through Kubernetes Config Connector on the same cluster or if it was create outside. |
| encryption.kmsKeyRefName | string | `"mykms"` | Name of the Cloud KMS key that will be used to encrypt objects inserted into this bucket |
| encryption.kmsKeyRefNamespace | string | `nil` | Namespace where the KMS key was created through KCC. Only use if kccControlled=true |
| lifecycleRule | list | See the `values.yaml` for more details | The bucket's lifecycle configuration. See [lifecycle management](https://cloud.google.com/storage/docs/lifecycle) for more information. |
| logging.enabled | bool | `false` | Enables logging for the bucket |
| logging.logBucket | string | `"access_log_gcs_irn70740_lab_adm"` | The destination bucket where the current bucket's logs should be placed. |
| logging.logObjectPrefix | string | `nil` | A prefix for log object names. The default prefix is the bucket name. |
| requestPays | bool | `false` | Charge the requester instead of the owner |
| retentionPolicy | object | `{"enabled":false,"isLocked":true,"retentionPeriod":8192}` | Bucket's retention policy configuration |
| retentionPolicy.enabled | bool | `false` | Enables the bucket's retention policy |
| retentionPolicy.isLocked | bool | `true` | Whether or not the retentionPolicy is locked. If true, the retentionPolicy cannot be removed and the retention period cannot be reduced. |
| retentionPolicy.retentionPeriod | int | `8192` | The period of time, in seconds, that objects in the bucket must be retained and cannot be deleted, overwritten, or made noncurrent. The value must be greater than 0 seconds and less than 3,155,760,000 seconds. |
| storageClass | string | `"STANDARD"` | Type of [storage class](https://cloud.google.com/storage/docs/storage-classes). Accepted values: [STANDARD, NEARLINE, COLDLINE, ARCHIVE] |
| enableVersioning | bool | `false` | Activate bucket versioning |
| website | object | `{"enabled":false,"mainPageSuffix":"index.html","notFoundPage":"404.html"}` | Website configuration of the bucket |
| website.enabled | bool | `false` | Enable website feature of the bucket |
| website.mainPageSuffix | string | `"index.html"` | Main page name |
| website.notFoundPage | string | `"404.html"` | Name of the page containing the 404 error page |

## Config Connector ressources

This chart is either based on GCP config connector ressources, or assumes it will be consumed by Config Connector. All KCC (Kubernetes Config Connector) CRDs are available on [gcp documentation](https://cloud.google.com/config-connector/docs/reference/overview).

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
helm install openlane-infra/openlane-gcp-bucket
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-bucket --config /charts/charts/openlane-gcp-bucket/ct.yaml
```
