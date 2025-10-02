[![Chart Publish](https://github.com/theopenlane/openlane-infra/actions/workflows/charts-publish.yml/badge.svg?branch=main)](https://github.com/heopenlane/openlane-infra/actions/workflows/charts-publish.yml)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache2.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=theopenlane_openlane-infra&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=theopenlane_openlane-infra)


# Openlane Helm Chart

This repo contains a basic helm chart for deploying the Openlane stack, as well as some other misc. items we use to manage our environment such as cert-manager, external-dns, and other general Kubernetes ecosystem components. If you're wanting purely the Openlane stack, that will be inside of `charts/openlane` and it's major direct dependency, OpenFGA which we have a wrapper for to the upstream FGA chart inside of `charts/openfga`.

> WARNING: Use these charts with caution and review the files beforehand! Because we have not yet invested a lot of time into parameterization of the charts `values.yaml`, many of the configuration options present do not directly control the deployment behavior, and many of the yaml files in the `templates directory are "flat" / contain hard-cded values.

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
