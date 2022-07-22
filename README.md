# terraform-google-log-analysis

This module was generated from [terraform-google-module-template](https://github.com/terraform-google-modules/terraform-google-module-template/), which by default generates a module that simply creates a GCS bucket. As the module develops, this README should be updated.

The resources/services/activations/deletions that this module will create/trigger are:

- Create a GCS bucket to ingest external log files
- Create a Cloud Run service to host a sample website
- Create a table in BigQuery to store logs
- Set up Logs Router to route Cloud Run web access logs to BigQuery
- Set up a BigQuery Data Transfer Service to transfer external logs in the Cloud Storage bucket to the BigQuery table

## Usage

Basic usage of this module is as follows:

```hcl
module "log_analysis" {
  source  = "terraform-google-modules/log-analysis/google"
  version = "~> 0.1"

  project_id  = "<PROJECT ID>"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| labels | A set of key/value label pairs to assign to the resources deployed by this blueprint. | `map(string)` | `{}` | no |
| project\_id | The project ID to provision resources to | `string` | n/a | yes |
| region | The Google Cloud region name to provision resources in | `string` | `"us-central1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| bigquery\_dataset\_name | The BigQuery dataset name which the transferred log table is in |
| bigquery\_table\_name | The BigQuery table name for transferred logs |
| bucket\_name | The Cloud Storage bucket to ingest logs from external soruces |
| cloud\_run\_url | The public URL on which the deployed example website is available |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.13
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v4.29.0

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Storage Admin: `roles/storage.admin`
- Cloud Run Admin: `roles/run.admin`
- BigQuery Admin: `roles/bigquery.admin`
- Service Account User: `roles/iam.serviceAccountUser`
- Create Service Accounts: `roles/iam.serviceAccountCreator`
- Project IAM Admin: `roles/resourcemanager.projectIamAdmin`
- Logs Configuration Writer: `roles/logging.configWriter`
- Service Usage Admin: `roles/serviceusage.serviceUsageAdmin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- IAM API: `iam.googleapis.com`
- Cloud Resource Manager API: `cloudresourcemanager.googleapis.com`
- Service Usage API: `serviceusage.googleapis.com`
- Compute Engine API: `compute.googleapis.com`
- Cloud Storage API: `storage-api.googleapis.com`
- Cloud Logging API: `logging.googleapis.com`
- Cloud Run API: `run.googleapis.com`
- BigQuery API: `bigquery.googleapis.com`
- BigQuery Data Transfer API: `bigquerydatatransfer.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[iam-module]: https://registry.terraform.io/modules/terraform-google-modules/iam/google
[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform]: https://www.terraform.io/downloads.html

## Security Disclosures

Please see our [security disclosure process](./SECURITY.md).
