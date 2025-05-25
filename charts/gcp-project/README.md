# GCP Project Provisioning Helm Chart (CNRM)

This Helm chart allows for the declarative creation and configuration of new GCP projects using **GCP Config Connector**.
It can be used to:
1.  Create a new GCP project.
2.  Enable a list of specified GCP APIs within that project.
3.  Create GCP Service Accounts and assign IAM roles within the project.

This chart is particularly useful for establishing a GitOps-driven project lifecycle, including
setting up host and service projects for Shared VPC.

## Usage

This chart is typically applied early in the provisioning process for new projects.

## Values

Review the `values.yaml` for configurable parameters.

### Important Notes

*   **Billing Account:** A `billingAccountRef` is required to associate new projects with a billing account.
*   **IAM Permissions:** The Config Connector controller running in your Config Controller must have sufficient IAM permissions (e.g., `resourcemanager.projects.create`, `servicemanager.services.enable`, `iam.serviceAccounts.create`, `iam.roles.bind`) at the Organization/Folder level, or on the parent project, to create and configure projects.
*   **Project IDs:** GCP Project IDs must be globally unique and are immutable.

**Conceptual `charts/gcp-project/templates/` changes:**
*   `project.yaml`: Defines a `Project` CR (`cloudresourcemanager.cnrm.cloud.google.com/v1beta1.Project`). The `billingAccountRef.external` points to the billing ID.
*   `api-services.yaml`: Iterates through `values.apiEnablement.services` to create `Service` CRs (`serviceusage.cnrm.cloud.google.com/v1beta1.Service`), referencing the `projectRef.external`.
*   `service-accounts.yaml`: Iterates through `values.iam.serviceAccounts` to create `ServiceAccount` CRs (`iam.cnrm.cloud.google.com/v1beta1.ServiceAccount`), referencing the `projectRef.external`.
*   `iam-bindings.yaml`: Iterates through `values.iam.projectBindings` to create `IAMPolicyMember` CRs (`iam.cnrm.cloud.google.com/v1beta1.IAMPolicyMember`) for project-level bindings, referencing the `projectRef.external`.