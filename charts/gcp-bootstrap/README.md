# openlane-gcp-bootstrap

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

## Prerequisites

- Helm v3
- Config Connector installed (v1.6.0)

## Description

Bootstrap chart for Openlane GCP infrastructure, creating folders, and generating ArgoCD Applications for project deployments.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| appProject.bigquery | object | `{}` |  |
| appProject.cloudsql | object | `{}` |  |
| appProject.dnsZone | object | `{}` |  |
| appProject.enabled | bool | `false` |  |
| appProject.gkeCluster | object | `{}` |  |
| appProject.memorystore | object | `{}` |  |
| appProject.project.apis[0] | string | `"compute.googleapis.com"` |  |
| appProject.project.apis[1] | string | `"container.googleapis.com"` |  |
| appProject.project.apis[2] | string | `"bigquery.googleapis.com"` |  |
| appProject.project.apis[3] | string | `"storage.googleapis.com"` |  |
| appProject.project.apis[4] | string | `"sqladmin.googleapis.com"` |  |
| appProject.project.apis[5] | string | `"redis.googleapis.com"` |  |
| appProject.project.apis[6] | string | `"dns.googleapis.com"` |  |
| appProject.project.gcpProjectName | string | `"Openlane Application"` |  |
| appProject.project.id | string | `""` |  |
| appProject.project.name | string | `"openlane-app"` |  |
| appProject.storage | object | `{}` |  |
| billingAccountId | string | `"YOUR_BILLING_ACCOUNT_ID_DEFAULT"` |  |
| billingProject.enabled | bool | `false` |  |
| billingProject.project.apis[0] | string | `"cloudbilling.googleapis.com"` |  |
| billingProject.project.gcpProjectName | string | `"Openlane Billing Admin"` |  |
| billingProject.project.id | string | `""` |  |
| billingProject.project.name | string | `"openlane-billing"` |  |
| commonAppConfig.bigquery.cmekEnabled | bool | `false` |  |
| commonAppConfig.bigquery.enabled | bool | `false` |  |
| commonAppConfig.bigquery.location | string | `"us-east4"` |  |
| commonAppConfig.cloudsql.cmekEnabled | bool | `false` |  |
| commonAppConfig.cloudsql.enabled | bool | `false` |  |
| commonAppConfig.cloudsql.instanceName | string | `"default-sql"` |  |
| commonAppConfig.cloudsql.tier | string | `"db-f1-micro"` |  |
| commonAppConfig.cloudsql.version | string | `"POSTGRES_14"` |  |
| commonAppConfig.dnsZone.domainName | string | `"default.com."` |  |
| commonAppConfig.dnsZone.enabled | bool | `false` |  |
| commonAppConfig.dnsZone.name | string | `"default-zone"` |  |
| commonAppConfig.gkeCluster.enabled | bool | `false` |  |
| commonAppConfig.gkeCluster.machineType | string | `"e2-standard-2"` |  |
| commonAppConfig.gkeCluster.masterAuthorizedNetworksConfig.cidrBlocks | list | `[]` |  |
| commonAppConfig.gkeCluster.masterAuthorizedNetworksConfig.enabled | bool | `false` |  |
| commonAppConfig.gkeCluster.nodeCount | int | `1` |  |
| commonAppConfig.gkeCluster.nodePools | list | `[]` |  |
| commonAppConfig.gkeCluster.workloadIdentityEnabled | bool | `true` |  |
| commonAppConfig.memorystore.enabled | bool | `false` |  |
| commonAppConfig.memorystore.instanceName | string | `"default-redis"` |  |
| commonAppConfig.memorystore.memorySizeGb | int | `1` |  |
| commonAppConfig.memorystore.tier | string | `"BASIC"` |  |
| commonAppConfig.primaryRegion | string | `"us-east4"` |  |
| commonAppConfig.storage.cmekEnabled | bool | `false` |  |
| commonAppConfig.storage.enabled | bool | `false` |  |
| commonAppConfig.storage.location | string | `"us-east4"` |  |
| folders.appEnv.id | string | `""` |  |
| folders.appEnv.name | string | `"app"` |  |
| folders.billingEnv.id | string | `""` |  |
| folders.billingEnv.name | string | `"billing"` |  |
| folders.loggingEnv.id | string | `""` |  |
| folders.loggingEnv.name | string | `"logging"` |  |
| folders.openlaneOrg.id | string | `""` |  |
| folders.openlaneOrg.name | string | `"openlane-org"` |  |
| folders.sharedInfraEnv.id | string | `""` |  |
| folders.sharedInfraEnv.name | string | `"shared-infra"` |  |
| kms.enabled | bool | `true` |  |
| kms.keyName | string | `"openlane-default-key"` |  |
| kms.keyRingName | string | `"openlane-default-keyring"` |  |
| kms.location | string | `"us-east4"` |  |
| kmsProject.enabled | bool | `false` |  |
| kmsProject.project.apis[0] | string | `"cloudkms.googleapis.com"` |  |
| kmsProject.project.folderRef | string | `"folders/{{ .Values.folders.openlaneOrg.id }}"` |  |
| kmsProject.project.gcpProjectName | string | `"Openlane Central KMS"` |  |
| kmsProject.project.id | string | `""` |  |
| kmsProject.project.name | string | `"openlane-kms"` |  |
| loggingProject.enabled | bool | `false` |  |
| loggingProject.logSinks.orgAudit.destinationBucketName | string | `"openlane-central-logs-bucket"` |  |
| loggingProject.logSinks.orgAudit.destinationDatasetName | string | `"openlane_central_logs_dataset"` |  |
| loggingProject.logSinks.orgAudit.enabled | bool | `true` |  |
| loggingProject.project.apis[0] | string | `"logging.googleapis.com"` |  |
| loggingProject.project.apis[1] | string | `"bigquery.googleapis.com"` |  |
| loggingProject.project.apis[2] | string | `"storage.googleapis.com"` |  |
| loggingProject.project.gcpProjectName | string | `"Openlane Central Logging"` |  |
| loggingProject.project.id | string | `""` |  |
| loggingProject.project.name | string | `"openlane-logs"` |  |
| orgId | string | `"YOUR_GCP_ORGANIZATION_ID_DEFAULT"` |  |
| orgPolicies.disableSerialPortAccess | bool | `true` |  |
| orgPolicies.disableServiceAccountKeyCreation | bool | `true` |  |
| orgPolicies.gkePrivateCluster.enabled | bool | `true` |  |
| orgPolicies.resourceLocations.allowedLocations[0] | string | `"us-east4"` |  |
| orgPolicies.resourceLocations.allowedLocations[1] | string | `"us-central1"` |  |
| orgPolicies.resourceLocations.enabled | bool | `true` |  |
| orgPolicies.skipDefaultNetworkCreation | bool | `false` |  |
| orgPolicies.vmExternalIpAccess.enabled | bool | `true` |  |
| orgPolicies.vmExternalIpAccess.policyType | string | `"DENY_ALL"` |  |
| repoURL | string | `"https://github.com/theopenlane/openlane-infra"` |  |
| sharedVpcHost.enabled | bool | `false` |  |
| sharedVpcHost.network.firewallRules.allowIAPSsh.enabled | bool | `true` |  |
| sharedVpcHost.network.firewallRules.allowIAPSsh.ports[0].ports[0] | string | `"22"` |  |
| sharedVpcHost.network.firewallRules.allowIAPSsh.ports[0].protocol | string | `"tcp"` |  |
| sharedVpcHost.network.firewallRules.allowIAPSsh.sourceRanges[0] | string | `"35.235.240.0/20"` |  |
| sharedVpcHost.network.firewallRules.allowIAPSsh.targetTags[0] | string | `"ssh-via-iap"` |  |
| sharedVpcHost.network.name | string | `"openlane-shared-vpc"` |  |
| sharedVpcHost.network.subnets.gkePodsSecondary.ipCidrRange | string | `"10.0.32.0/16"` |  |
| sharedVpcHost.network.subnets.gkePodsSecondary.name | string | `"gke-pods"` |  |
| sharedVpcHost.network.subnets.gkePrimary.ipCidrRange | string | `"10.0.0.0/20"` |  |
| sharedVpcHost.network.subnets.gkePrimary.name | string | `"gke-primary"` |  |
| sharedVpcHost.network.subnets.gkePrimary.privateIpGoogleAccess | bool | `true` |  |
| sharedVpcHost.network.subnets.gkeServicesSecondary.ipCidrRange | string | `"10.0.16.0/20"` |  |
| sharedVpcHost.network.subnets.gkeServicesSecondary.name | string | `"gke-services"` |  |
| sharedVpcHost.network.subnets.internalApps.ipCidrRange | string | `"10.0.48.0/20"` |  |
| sharedVpcHost.network.subnets.internalApps.name | string | `"internal-apps"` |  |
| sharedVpcHost.network.subnets.internalApps.privateIpGoogleAccess | bool | `true` |  |
| sharedVpcHost.project.apis[0] | string | `"compute.googleapis.com"` |  |
| sharedVpcHost.project.apis[1] | string | `"servicenetworking.googleapis.com"` |  |
| sharedVpcHost.project.apis[2] | string | `"cloudresourcemanager.googleapis.com"` |  |
| sharedVpcHost.project.apis[3] | string | `"cloudkms.googleapis.com"` |  |
| sharedVpcHost.project.gcpProjectName | string | `"Openlane Shared VPC Host"` |  |
| sharedVpcHost.project.id | string | `""` |  |
| sharedVpcHost.project.name | string | `"openlane-shared-vpc-host"` |  |
| sharedVpcHost.serviceProjects | object | `{}` |  |

## Installing the Chart

### With Helm

To install the chart with the release name `my-release`:

```bash
helm repo add openlane-infra https://theopenlane.github.io/openlane-infra
helm install openlane-infra/openlane-gcp-bootstrap
```

### With ArgoCD

Add new application as:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: openlane-gcp-bootstrap
spec:
  project: infra

  source:
    repoURL: "https://theopenlane.github.io/openlane-infra"
    targetRevision: "0.1.0"
    chart: openlane-gcp-bootstrap
    path: ''
    helm:
      values: |

  destination:
    server: https://kubernetes.default.svc
    namespace: "cnrm-system"
  syncPolicy:
    automated:
      prune: true
```

## Develop

### Update documentation

Chart documentation is generated with [helm-docs](https://github.com/norwoodj/helm-docs) from `values.yaml` file.
After file modification, regenerate README.md with command:

```bash
docker run --rm -it -v $(pwd):/helm --workdir /helm jnorwood/helm-docs:v1.14.2 helm-docs
```

### Run linter

```bash
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane-gcp-bootstrap --config /charts/charts/openlane-gcp-bootstrap/ct.yaml
```

### Run pluto

In order to check if the api-version used in this chart are not deprecated, or worse, removed, we use pluto to check it:

```
docker run --rm -it -v $(pwd):/apps -v pluto:/pluto alpine/helm:3.17 template openlane-gcp-bootstrap . -f tests/pluto/values.yaml --output-dir /pluto
docker run --rm -it -v pluto:/data us-docker.pkg.dev/fairwinds-ops/oss/pluto:v5 detect-files -d /data -o yaml --ignore-deprecations -t "k8s=v1.31.0,cert-manager=v1.17.0,istio=v1.24.0" -o wide
docker volume rm pluto
```

