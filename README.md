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
| project\_id | The project ID to deploy to | `any` | n/a | yes |

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
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v3.0

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Storage Admin: `roles/storage.admin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Google Cloud Storage JSON API: `storage-api.googleapis.com`

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
