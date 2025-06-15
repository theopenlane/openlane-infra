# openlane-external-dns

This chart is responsible for managing the openlane-external-dns resources in a GCP project. It is designed to be used with Config Connector and ArgoCD. All of the helm-specific values and information can be found in the [HELM.md](HELM.md) file, which is generated from the `values.yaml` file.

## Google specific

```
gcloud projects add-iam-policy-binding projects/prod-apps-project \
    --role=roles/dns.admin \
    --member=principal://iam.googleapis.com/projects/323616316362/locations/global/workloadIdentityPools/prod-apps-project.svc.id.goog/subject/ns/external-dns/sa/external-dns \
    --condition=None
```
