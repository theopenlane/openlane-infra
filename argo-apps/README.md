# Argo apps

This directory contains ArgoCD `Application` and supporting manifests that can be
applied directly using `kubectl apply -f`.
Each application points back to this repository so changes are automatically
reconciled by ArgoCD.

## Included Applications

- `external-dns`
- `cert-manager`

To deploy all applications:

```bash
kubectl apply -f argocd-apps/
```

## Sample app

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: openlane-app
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/theopenlane/openlane-application.git # Replace with actual Openlane app repo
    targetRevision: HEAD
    path: deploy/kubernetes # Or where your Openlane app manifests are
  destination:
    server: https://kubernetes.default.svc  # Target the Workload GKE cluster (assuming Config Controller has access)
    namespace: openlane
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
```
