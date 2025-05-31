# API Fields

https://cloud.google.com/config-connector/docs/reference/resource-docs/container/containercluster

https://cloud.google.com/config-connector/docs/reference/resource-docs/sql/sqlinstance

https://cloud.google.com/config-connector/docs/reference/resource-docs/monitoring/monitoringalertpolicy

https://cloud.google.com/config-connector/docs/reference/resource-docs/dns/dnsmanagedzone

https://cloud.google.com/config-connector/docs/reference/resource-docs/redis/rediscluster

https://cloud.google.com/config-connector/docs/reference/resource-docs/serviceusage/service

## CRDs

```bash
curl -sSL https://github.com/GoogleCloudPlatform/k8s-config-connector/blob/master/install-bundles/install-bundle-autopilot-workload-identity/crds.yaml -o .schema-cache/gcp-crds.yaml
curl -sSL https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/example/prometheus-operator-crd/monitoring.coreos.com_alertmanagers.yaml -o .schema-cache/alertmanager.yaml
curl -sSL https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml -o .schema-cache/servicemonitor.yaml
curl -sSL https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/main/example/prometheus-operator-crd/monitoring.coreos.com_prometheusrules.yaml -o .schema-cache/prometheusrule.yaml
curl -sSL https://raw.githubusercontent.com/cert-manager/cert-manager/master/deploy/crds/crd-certificates.yaml -o .schema-cache/cert-manager-crds.yaml
curl -sSL https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/servicemonitor_v1.json -o .schema-cache/servicemonitor.json
curl -sSL https://raw.githubusercontent.com/datreeio/CRDs-catalog/refs/heads/main/monitoring.coreos.com/prometheusrule_v1.json -o .schema-cache/prometheusrule.json
```
