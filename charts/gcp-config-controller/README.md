# GCP Config Controller Helm Chart (CNRM)

This Helm chart defines the desired state for a GCP Config Controller instance using Config Connector.
While the actual Config Controller instance is typically created via `gcloud config-controller create`,
this CNRM resource serves as a declarative representation within your GitOps pipeline.

## Values

Review the `values.yaml` for configurable parameters.

## External Resources

The `ConfigController` resource automatically manages:
*   A GKE cluster (Config Controller cluster)
*   Config Sync
*   Config Connector