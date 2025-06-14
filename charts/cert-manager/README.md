# openlane-cert-manager

This chart is responsible for managing the openlane-cert-manager resources in a GCP project. It is designed to be used with Config Connector and ArgoCD. All of the helm-specific values and information can be found in the [HELM.md](HELM.md) file, which is generated from the `values.yaml` file.

gcloud iam service-accounts create dns01-solver \
  --display-name "dns01-solver" \
  --project=prod-apps-project

gcloud projects add-iam-policy-binding prod-apps-project \
  --member serviceAccount:dns01-solver@prod-apps-project.iam.gserviceaccount.com \
  --role roles/dns.admin \
  --project=prod-apps-project

gcloud iam service-accounts add-iam-policy-binding \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:prod-apps-project.svc.id.goog[cert-manager/cert-manager]" \
    dns01-solver@prod-apps-project.iam.gserviceaccount.com \
  --project=prod-apps-project
