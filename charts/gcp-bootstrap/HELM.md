![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

# openlane-gcp-bootstrap

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
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

Bootstrap chart for Openlane GCP infrastructure, creating folders, and generating ArgoCD Applications for project deployments.

## Source Code

* <https://github.com/theopenlane/core>
* <https://github.com/theopenlane/openlane-infra>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| orgId | string | `"319013011373"` |  |
| billingAccountId | string | `"01AC20-2CEAE3-8BB367"` |  |
| repoURL | string | `"https://github.com/theopenlane/openlane-infra"` |  |
| projectCreation.project_id_prefix | string | `"openlane"` |  |
| env.name | string | `"unset"` |  |
| env.capitalizedName | string | `"Unset"` |  |
| orgPolicies.disableServiceAccountKeyCreation | bool | `true` |  |
| orgPolicies.skipDefaultNetworkCreation | bool | `false` |  |
| orgPolicies.disableSerialPortAccess | bool | `true` |  |
| orgPolicies.resourceLocations.enabled | bool | `true` |  |
| orgPolicies.resourceLocations.allowedLocations[0] | string | `"us-east4"` |  |
| orgPolicies.resourceLocations.allowedLocations[1] | string | `"us-central1"` |  |
| orgPolicies.vmExternalIpAccess.enabled | bool | `true` |  |
| orgPolicies.vmExternalIpAccess.policyType | string | `"DENY_ALL"` |  |
| orgPolicies.gkePrivateCluster.enabled | bool | `true` |  |
| kms.enabled | bool | `true` |  |
| kms.keyRingName | string | `"openlane-default-keyring"` |  |
| kms.keyName | string | `"openlane-default-key"` |  |
| kms.location | string | `"us-central1"` |  |
| commonAppConfig.primaryRegion | string | `"us-central1"` |  |
| commonAppConfig.gkeCluster.enabled | bool | `false` |  |
| commonAppConfig.gkeCluster.nodeCount | int | `1` |  |
| commonAppConfig.gkeCluster.machineType | string | `"e2-standard-2"` |  |
| commonAppConfig.gkeCluster.workloadIdentityEnabled | bool | `true` |  |
| commonAppConfig.gkeCluster.masterAuthorizedNetworksConfig.enabled | bool | `false` |  |
| commonAppConfig.gkeCluster.masterAuthorizedNetworksConfig.cidrBlocks | list | `[]` |  |
| commonAppConfig.gkeCluster.nodePools | list | `[]` |  |
| commonAppConfig.bigquery.enabled | bool | `false` |  |
| commonAppConfig.bigquery.location | string | `"us-central1"` |  |
| commonAppConfig.bigquery.cmekEnabled | bool | `false` |  |
| commonAppConfig.storage.enabled | bool | `false` |  |
| commonAppConfig.storage.location | string | `"us-central1"` |  |
| commonAppConfig.storage.cmekEnabled | bool | `false` |  |
| commonAppConfig.cloudsql.enabled | bool | `false` |  |
| commonAppConfig.cloudsql.instanceName | string | `"default-sql"` |  |
| commonAppConfig.cloudsql.version | string | `"POSTGRES_14"` |  |
| commonAppConfig.cloudsql.tier | string | `"db-f1-micro"` |  |
| commonAppConfig.cloudsql.cmekEnabled | bool | `false` |  |
| commonAppConfig.memorystore.enabled | bool | `false` |  |
| commonAppConfig.memorystore.instanceName | string | `"default-redis"` |  |
| commonAppConfig.memorystore.tier | string | `"BASIC"` |  |
| commonAppConfig.memorystore.memorySizeGb | int | `1` |  |
| commonAppConfig.dnsZone.enabled | bool | `false` |  |
| commonAppConfig.dnsZone.name | string | `"default-zone"` |  |
| commonAppConfig.dnsZone.domainName | string | `"default.com."` |  |
| commonAppConfig.enableAPIs[0] | string | `"compute.googleapis.com"` |  |
| commonAppConfig.enableAPIs[1] | string | `"servicenetworking.googleapis.com"` |  |
| commonAppConfig.enableAPIs[2] | string | `"iam.googleapis.com"` |  |
| commonAppConfig.enableAPIs[3] | string | `"container.googleapis.com"` |  |
| commonAppConfig.enableAPIs[4] | string | `"cloudresourcemanager.googleapis.com"` |  |
| commonAppConfig.enableAPIs[5] | string | `"dns.googleapis.com"` |  |
| commonAppConfig.enableAPIs[6] | string | `"cloudkms.googleapis.com"` |  |
| commonAppConfig.enableAPIs[7] | string | `"sqladmin.googleapis.com"` |  |
| commonAppConfig.enableAPIs[8] | string | `"redis.googleapis.com"` |  |
| commonAppConfig.enableAPIs[9] | string | `"logging.googleapis.com"` |  |
| commonAppConfig.enableAPIs[10] | string | `"monitoring.googleapis.com"` |  |
| sharedVpcHost.enabled | bool | `true` |  |
| sharedVpcHost.project.name | string | `"shared-vpc"` |  |
| sharedVpcHost.project.gcpProjectName | string | `"shared-vpc"` |  |
| sharedVpcHost.project.id | string | `""` |  |
| sharedVpcHost.network.name | string | `"shared-vpc"` |  |
| sharedVpcHost.network.subnets.gkePrimary.name | string | `"gke-primary"` |  |
| sharedVpcHost.network.subnets.gkePrimary.ipCidrRange | string | `"10.0.0.0/20"` |  |
| sharedVpcHost.network.subnets.gkePrimary.privateIpGoogleAccess | bool | `true` |  |
| sharedVpcHost.network.subnets.gkePodsSecondary.name | string | `"gke-pods"` |  |
| sharedVpcHost.network.subnets.gkePodsSecondary.ipCidrRange | string | `"10.0.32.0/16"` |  |
| sharedVpcHost.network.subnets.gkeServicesSecondary.name | string | `"gke-services"` |  |
| sharedVpcHost.network.subnets.gkeServicesSecondary.ipCidrRange | string | `"10.0.16.0/20"` |  |
| sharedVpcHost.network.subnets.internalApps.name | string | `"internal-apps"` |  |
| sharedVpcHost.network.subnets.internalApps.ipCidrRange | string | `"10.0.48.0/20"` |  |
| sharedVpcHost.network.subnets.internalApps.rivateIpGoogleAccess | bool | `true` |  |
| sharedVpcHost.firewallRules.allowIAPSsh.enabled | bool | `true` |  |
| sharedVpcHost.firewallRules.allowIAPSsh.sourceRanges[0] | string | `"35.235.240.0/20"` |  |
| sharedVpcHost.firewallRules.allowIAPSsh.targetTags[0] | string | `"ssh-via-iap"` |  |
| sharedVpcHost.firewallRules.allowIAPSsh.ports.protocol | string | `"tcp"` |  |
| sharedVpcHost.firewallRules.allowIAPSsh.ports.ports[0] | string | `"22"` |  |
| sharedVpcHost.serviceProjects | list | `[]` |  |
| appProject.enabled | bool | `true` |  |
| appProject.project.name | string | `"openlane-app"` |  |
| appProject.project.gcpProjectName | string | `"Openlane Application"` |  |
| appProject.project.id | string | `""` |  |
| appProject.gkeCluster | object | `{}` |  |
| appProject.bigquery | object | `{}` |  |
| appProject.storage | object | `{}` |  |
| appProject.cloudsql | object | `{}` |  |
| appProject.memorystore | object | `{}` |  |
| appProject.dnsZone | object | `{}` |  |
| loggingProject.enabled | bool | `true` |  |
| loggingProject.project.name | string | `"openlane-logs"` |  |
| loggingProject.project.gcpProjectName | string | `"Openlane Central Logging"` |  |
| loggingProject.project.id | string | `""` |  |
| loggingProject.logSinks.orgAudit.enabled | bool | `true` |  |
| loggingProject.logSinks.orgAudit.destinationBucketName | string | `"openlane-central-logs-bucket"` |  |
| loggingProject.logSinks.orgAudit.destinationDatasetName | string | `"openlane_central_logs_dataset"` |  |
| billingProject.enabled | bool | `true` |  |
| billingProject.project.name | string | `"openlane-billing"` |  |
| billingProject.project.gcpProjectName | string | `"Openlane Billing Admin"` |  |
| billingProject.project.id | string | `""` |  |
| kmsProject.enabled | bool | `true` |  |
| kmsProject.project.name | string | `"openlane-kms"` |  |
| kmsProject.project.gcpProjectName | string | `"Openlane Central KMS"` |  |
| kmsProject.project.id | string | `""` |  |
| sharedInfrastructureProject.enabled | bool | `true` |  |
| sharedInfrastructureProject.project.name | string | `"openlane-shared-infra"` |  |
| sharedInfrastructureProject.project.gcpProjectName | string | `"Openlane Shared Infrastructure"` |  |
| sharedInfrastructureProject.project.id | string | `""` |  |
| bootstrapProject.enabled | bool | `true` |  |
| bootstrapProject.project.name | string | `"openlane-misc"` |  |
| bootstrapProject.project.gcpProjectName | string | `"Openlane Bootstrap Project"` |  |
| bootstrapProject.project.id | string | `""` |  |
| folders.bootstrap.displayName | string | `"bootstrap"` |  |
| folders.bootstrap.parentType | string | `"organization"` |  |
| folders.bootstrap.parent | string | `"319013011373"` |  |
| folders.bootstrap.id | string | `""` |  |
| folders.bootstrap.billingAccountRef | string | `"01AC20-2CEAE3-8BB367"` |  |
| folders.bootstrap.enableAPIs[0] | string | `"iam.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[1] | string | `"cloudresourcemanager.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[2] | string | `"dns.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[3] | string | `"compute.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[4] | string | `"servicenetworking.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[5] | string | `"container.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[6] | string | `"storage.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[7] | string | `"artifactregistry.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[8] | string | `"anthosidentityservice.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[9] | string | `"anthosgke.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[10] | string | `"autoscaling.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[11] | string | `"anthos.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[12] | string | `"anthospolicycontroller.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[13] | string | `"config.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[14] | string | `"cloudapis.googleapis.com"` |  |
| folders.bootstrap.enableAPIs[15] | string | `"servicemanagement.googleapis.com"` |  |
| folders.common.displayName | string | `"common"` |  |
| folders.common.parentType | string | `"organization"` |  |
| folders.common.parent | string | `"319013011373"` |  |
| folders.common.id | string | `""` |  |
| folders.common.billingAccountRef | string | `"01AC20-2CEAE3-8BB367"` |  |
| folders.common.enableAPIs[0] | string | `"iam.googleapis.com"` |  |
| folders.common.enableAPIs[1] | string | `"serviceusage.googleapis.com"` |  |
| folders.common.enableAPIs[2] | string | `"compute.googleapis.com"` |  |
| folders.common.enableAPIs[3] | string | `"logging.googleapis.com"` |  |
| folders.common.enableAPIs[4] | string | `"storage.googleapis.com"` |  |
| folders.common.enableAPIs[5] | string | `"cloudtrace.googleapis.com"` |  |
| folders.common.enableAPIs[6] | string | `"monitoring.googleapis.com"` |  |
| folders.common.enableAPIs[7] | string | `"cloudbilling.googleapis.com"` |  |
| folders.common.enableAPIs[8] | string | `"dns.googleapis.com"` |  |
| folders.common.enableAPIs[9] | string | `"servicenetworking.googleapis.com"` |  |
| folders.common.enableAPIs[10] | string | `"secretmanager.googleapis.com"` |  |
| folders.common.enableAPIs[11] | string | `"cloudkms.googleapis.com"` |  |
| folders.common.enableAPIs[12] | string | `"analyticshub.googleapis.com"` |  |
| folders.common.enableAPIs[13] | string | `"bigquery.googleapis.com"` |  |
| folders.common.enableAPIs[14] | string | `"bigqueryconnection.googleapis.com"` |  |
| folders.common.enableAPIs[15] | string | `"bigquerymigration.googleapis.com"` |  |
| folders.common.enableAPIs[16] | string | `"cloudidentity.googleapis.com"` |  |
| folders.common.enableAPIs[17] | string | `"auditmanager.googleapis.com"` |  |
| folders.common.enableAPIs[18] | string | `"cloudbuild.googleapis.com"` |  |
| folders.common.enableAPIs[19] | string | `"clouddeploy.googleapis.com"` |  |
| folders.common.enableAPIs[20] | string | `"cloudasset.googleapis.com"` |  |
| folders.common.enableAPIs[21] | string | `"identitytoolkit.googleapis.com"` |  |
| folders.common.enableAPIs[22] | string | `"networkmanagement.googleapis.com"` |  |
| folders.common.enableAPIs[23] | string | `"trafficdirector.googleapis.com"` |  |
| folders.common.enableAPIs[24] | string | `"servicemanagement.googleapis.com"` |  |
| projects.common-shared-kms.displayName | string | `"common-shared-kms"` |  |
| projects.common-shared-kms.parentType | string | `"folder"` |  |
| projects.common-shared-kms.parent | string | `"common"` |  |
| projects.common-shared-kms.id | string | `""` |  |
| projects.common-shared-kms.type | string | `"sharedInfrastructureProject"` |  |
| projects.common-shared-secrets.displayName | string | `"common-shared-secrets"` |  |
| projects.common-shared-secrets.parentType | string | `"folder"` |  |
| projects.common-shared-secrets.parent | string | `"common"` |  |
| projects.common-shared-secrets.id | string | `""` |  |
| projects.common-shared-secrets.type | string | `"sharedInfrastructureProject"` |  |
| projects.common-shared-network-project.displayName | string | `"common-shared-network-project"` |  |
| projects.common-shared-network-project.parentType | string | `"folder"` |  |
| projects.common-shared-network-project.parent | string | `"common"` |  |
| projects.common-shared-network-project.id | string | `""` |  |
| projects.common-shared-network-project.type | string | `"sharedVpcHost"` |  |
| projects.common-shared-logging.displayName | string | `"common-shared-logging"` |  |
| projects.common-shared-logging.parentType | string | `"folder"` |  |
| projects.common-shared-logging.parent | string | `"common"` |  |
| projects.common-shared-logging.id | string | `""` |  |
| projects.common-shared-logging.type | string | `"loggingProject"` |  |
| projects.common-shared-monitoring.displayName | string | `"common-shared-monitoring"` |  |
| projects.common-shared-monitoring.parentType | string | `"folder"` |  |
| projects.common-shared-monitoring.parent | string | `"common"` |  |
| projects.common-shared-monitoring.id | string | `""` |  |
| projects.common-shared-monitoring.type | string | `"loggingProject"` |  |
| projects.common-billing-project.displayName | string | `"common-billing-project"` |  |
| projects.common-billing-project.parentType | string | `"folder"` |  |
| projects.common-billing-project.parent | string | `"common"` |  |
| projects.common-billing-project.id | string | `""` |  |
| projects.common-billing-project.type | string | `"billingProject"` |  |

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
helm install openlane-infra/openlane-gcp-bootstrap
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
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-bootstrap --config /charts/charts/openlane-gcp-bootstrap/ct.yaml
```
