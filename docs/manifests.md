# API Fields

https://cloud.google.com/config-connector/docs/reference/resource-docs/container/containercluster

https://cloud.google.com/config-connector/docs/reference/resource-docs/sql/sqlinstance

https://cloud.google.com/config-connector/docs/reference/resource-docs/monitoring/monitoringalertpolicy

https://cloud.google.com/config-connector/docs/reference/resource-docs/dns/dnsmanagedzone

https://cloud.google.com/config-connector/docs/reference/resource-docs/redis/rediscluster

https://cloud.google.com/config-connector/docs/reference/resource-docs/serviceusage/service

## Annotations

| Annotation                                                        | Description                                                                                                                                                                                                                                   |
|-------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `cnrm.cloud.google.com/deletion-policy: POLICY`                   | Can be `"none"` or `"abandon"`. When deleting a Config Connector resource, the associated Google Cloud resource is deleted by default. To keep the Google Cloud resource, specify `"abandon"`. Default value is `"none"`.                     |
| `cnrm.cloud.google.com/management-conflict-prevention-policy: POLICY` | Can be `"none"` or `"resource"`. For more details, see [Managing conflicts with multiple Config Connector resources](https://cloud.google.com/config-connector/docs/how-to/management-conflict-prevention-policy). Default value is `"none"`. |
| `cnrm.cloud.google.com/ignore-clusterless: "true"`                | Can be `"true"` or `"false"`. Indicates resources which should be skipped when running outside a server environment. For example, these resources will not be exported as Terraform. Default value is `"false"`.                              |
| `cnrm.cloud.google.com/reconcile-interval-in-seconds: NUMBER`     | Must be non-negative integers. For more details, see [Configuring the reconciliation interval](https://cloud.google.com/config-connector/docs/how-to/reconciliation-interval).                                                                |
| `cnrm.cloud.google.com/force-destroy: true` | When this annotation is enabled, GCP will handle dependency deletion to delete the resource; ex: if you attempt to delete a storage bucket with objects in it, the deletion will fail because objects are still inside. With this annotation, KCC will remove all the objects within the bucket and then remove the bucket. Use with caution. |
| `cnrm.cloud.google.com/state-into-spec: abset` | Absent is the recommended behavior. Config Connector will not populate any unspecified fields into the spec. The alternate option is `merge` - see [docs](https://cloud.google.com/config-connector/docs/concepts/ignore-unspecified-fields) |

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
