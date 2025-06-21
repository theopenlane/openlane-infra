# openlane-prometheus-crds

This chart installs only the Prometheus Operator Custom Resource Definitions (CRDs). It is intended for clusters where monitoring components are managed separately but objects like `ServiceMonitor` or `PrometheusRule` are required.

All helm-specific configuration options are documented in [HELM.md](HELM.md), which is generated from `values.yaml`.
