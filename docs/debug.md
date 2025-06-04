# Debugging

Check version of config connector

```bash
kubectl get ns cnrm-system -o jsonpath='{.metadata.annotations.cnrm\.cloud\.google\.com/version}'
```

List all config connector resources

```bash
kubectl get gcp
```

check controller logs

```bash
kubectl logs -n cnrm-system \
    -l cnrm.cloud.google.com/component=cnrm-controller-manager \
    -c manager
```

Get KCC events

```bash
kubectl --namespace CC_NAMESPACE get events
```

### Config Connector-specific events

| Event Type                    | Description |
|-------------------------------|-------------|
| **Updating**                  | Occurs when a Config Connector resource's underlying Google Cloud resource is being updated. |
| **UpToDate**                  | Occurs when a Config Connector resource's reconciliation has succeeded. The underlying Google Cloud resource now matches the desired state. |
| **UpdateFailed**              | Occurs when a Config Connector resource's reconciliation has failed. |
| **DependencyNotReady**        | Occurs when a referenced Config Connector resource is not ready. Check its status to determine readiness. |
| **DependencyNotFound**        | Occurs when a referenced Config Connector resource or Kubernetes Secret is not found. |
| **DependencyInvalid**         | Occurs when a reference is invalid (e.g., a referenced Secret exists but does not contain the required key). |
| **Deleting**                  | Occurs when a Config Connector resource is being deleted from the Kubernetes API Server. |
| **Deleted**                   | Occurs when a Config Connector resource has been successfully deleted from the Kubernetes API Server. |
| **DeleteFailed**              | Occurs when a Config Connector resource has failed to be deleted from the Kubernetes API Server. |
| **ManagementConflict**        | Occurs when a Config Connector resource fails to take ownership of the underlying Google Cloud resource, usually due to another resource already having ownership. |
| **PreActuationTransformFailed**  | Occurs when a Config Connector resource fails to perform pre-actuation transformations, likely due to invalid configuration. |
| **PostActuationTransformFailed** | Occurs when a Config Connector resource fails to perform post-actuation transformations. |
| **Unmanaged**                 | Occurs when Config Connector is in namespaced-mode and the resource is in a namespace where Config Connector is not enabled. This can also happen if the ConfigConnectorContext was created around the same time as the resource—wait for Config Connector to start managing it. |


## Abandon and acquire the resource

In some cases, you might need to update an immutable field in a resource. Since you can't edit immutable fields, you must abandon and then acquire the resource:

- Update the YAML configuration of the Config Connector resource and set the cnrm.cloud.google.com/deletion-policy annotation to abandon.
- Apply the updated YAML configuration to update the Config Connector resource's deletion policy.
- Abandon the Config Connector resource.
- Update the immutable fields that need to be changed in the YAML configuration.
- Apply the updated YAML configuration to acquire the abandoned resource.
