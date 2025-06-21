[![Chart Publish](https://github.com/theopenlane/openlane-infra/actions/workflows/charts-publish.yml/badge.svg?branch=main)](https://github.com/heopenlane/openlane-infra/actions/workflows/publish.yml)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache2.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=theopenlane_openlane-infra&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=theopenlane_openlane-infra)

> NOTE: This repository is currently in **beta**. It is not yet production-ready, but we are actively working on it. Please use with caution!

# Openlane Infrastructure Provisioning

This repository contains Helm charts and scripts designed to provision production-grade GCP infrastructure using a GitOps approach, powered by **GCP Config Controller** (which includes managed Config Sync and **Config Connector**). The infrastructure includes a GKE Autopilot cluster, shared VPC, DNS, Load Balancing (ingress), CloudSQL, and Memorystore Redis.

## Architecture Overview

The general goal of this repo (and the chart structure) is to be able to include, as chart dependencies, infrastructure related resources alongside the application resources. What this means practically is that we want to have the same templating mechanism for things like GCP service accounts or IP addresses as we do for applications we deploy onto a Kubernetes cluster.

For example, when you are deploying `external-DNS` and `cert-manager` the deployment instructions created by the various maintainers of those projects have you doing things like:

- creating GCP service accounts
- creating IAM policy bindings
- creating DNS zones if they don't exist
- creating certificate maps or managed certificate resources
- among other things...

From our experience this usually involves a mix of either manual commands, some gross combination of terraform + helm, or some other weird combination. Since we already planned / wanted to use helm to define our application resources, and GCP provides a similarly yaml-oriented declarative configuration setup with Config Connector, we decided to try and make charts (and include as chart depepdencdies) so that we could have both our application and our infrastructure defined in a similar-ish way.


## Chart Scaffolding

The repository includes a custom shell script (`openlane-chart.sh`) to scaffold new charts. This tool automates the process of:

- Creating a new Helm chart
- Removing default templates
- Updating `Chart.yaml` with dependency details (including optional alias support)
- Rendering default values and external templates
- Building Helm dependencies
- Generating documentation with helm-docs

Example usage:

```bash
./scripts/openlane-chart.sh create
  --name my-new-chart
  --dependency-url https://charts.example.com
  --dependency-chart-name example-chart
  --dependency-chart-version 1.2.3
  --dependency-alias exchart
```

### Linting and Testing

We use [Chart Testing](https://github.com/helm/chart-testing) to ensure our charts follow best practices. To lint a chart, run either:

```
task lint
```
or

```bash
docker run --rm -it -w /charts -v $(pwd)/../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/<chart-name> --config /charts/charts/<chart-name>/ct.yaml
```

### Documentation Generation

Documentation is automatically generated from chart annotations using helm-docs. To manually generate documentation:

```bash
task docs
```
