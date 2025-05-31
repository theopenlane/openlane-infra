## Design Rationale

When determining the best approach for provisioning Openlane's infrastructure as well as deploying and managing the Openlane application stack, we evaluated several options and providers. The founders of Openlane have extensive experience in the DevOps and SRE space, and we have a strong preference for using **GitOps** principles to manage our infrastructure. We also wanted to ensure that the solution was fully declarative, easy to manage, and would be generally portable to other cloud providers if we chose to do so in the future.

Additionally, early on we made a lot of decisions around our application stack that involved us ground-up writing things like our own authentication and authorization system because we believed that integrating a dozen vertical cloud providers into the open source stack dramatically reduced the relevancy to the open source community. We wanted to be sure we could run Openlane on any cloud provider, and that we could do so in a way that was easy to manage and maintain.

We chose to use **GCP Config Connector** for the following reasons:
*   **Declarative Management:** Config Connector allows for a fully declarative approach to managing GCP resources, which aligns with the GitOps philosophy.
*   **Native Kubernetes Integration:** Config Connector resources are defined as Kubernetes Custom Resources, making it easier to manage GCP resources alongside Kubernetes resources.
*   **GitOps Compatibility:** Config Connector works seamlessly with GitOps tools like Config Sync and ArgoCD, allowing for a unified workflow for managing both infrastructure and applications.
*   **Reduced Complexity:** Using Config Connector reduces the complexity of managing GCP resources, as it eliminates the need for a separate Terraform state file and management process.
*   **Real-time Reconciliation:** Config Connector continuously reconciles the desired state defined in Git with the actual state of GCP resources, ensuring that any drift is automatically corrected.
*   **Seamless Integration with GKE:** Config Connector is designed to work seamlessly with GKE, making it easier to manage Kubernetes resources and GCP resources together.

### Considered and Rejected Alternatives

- Terraform: While Terraform is a powerful tool for managing infrastructure, it introduces additional complexity with state management and does not natively integrate with Kubernetes resources. The GitOps workflow would also be more complex, as Terraform would require separate state management and reconciliation processes.
- Pulumi / Crossplane / other Infrastructure as Code tools: These tools offer similar capabilities to Terraform but also introduce additional complexity and do not provide the same level of integration with Kubernetes resources as Config Connector.
- `kpt` or `kustomize`: Both of these tools could be used in conjunction with Config Connector (allowing for templating and customization of declarative resources), but `kpt` is not as widely adopted in the Kubernetes ecosystem as Helm. Additionally, `kustomize` does not support the same level of templating and customization as Helm, which would make it more difficult to manage complex configurations.
