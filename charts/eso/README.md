# openlane-eso

This chart is responsible for managing the openlane-eso resources in a GCP project. It is designed to be used with Config Connector and ArgoCD. All of the helm-specific values and information can be found in the [HELM.md](HELM.md) file, which is generated from the `values.yaml` file.

## Notes

This command was additionally required to get the workload identity bits to work:

```bash
gcloud iam service-accounts add-iam-policy-binding prod-gke-central1@prod-apps-project.iam.gserviceaccount.com --role roles/iam.workloadIdentityUser --member "serviceAccount:prod-apps-project.svc.id.goog[external-secrets/gcp-secretsstore-sa]"
```
