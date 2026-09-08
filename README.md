# Log analysis pipeline

The resources/services/activations/deletions that this module will create/trigger are:

- Create a GCS bucket to ingest external log files
- Create a Cloud Run service to host a sample website
- Create a table in BigQuery to store logs
- Set up Logs Router to route Cloud Run web access logs to BigQuery
- Set up a BigQuery Data Transfer Service to transfer external logs in the Cloud Storage bucket to the BigQuery table

### Tagline
Create a pipeline to analyze logs across environments.

### Detailed
Create a pipeline to analyze various data and logs of applications running across different environments like Google Cloud, other clouds and on-premises
You can choose whether to deploy your solution through the console directly or download as Terraform on GitHub to deploy later.

### Architecture
1. A web server deployed on Cloud Run generates web access logs when a user visits a sample website deployed on it. The web access logs are automatically sent to Logging.
1. Logging then routes the logs to a designated table in BigQuery per sink configured.
1. Files that contain application logs can be uploaded into a bucket in Cloud Storage. (This solution deploys a text file that contains a sample web access log in JSON format.)
1. BigQuery Data Transfer Service then periodically loads the file to a designated table in BigQuery per transfer configured.
1. You can run queries against the logs in the table or use Data Studio to visualize the logs.

## Documentation
- [Architecture Diagram](https://github.com/GoogleCloudPlatform/terraform-google-log-analysis/blob/main/assets/log_analysis_pipeline_v1.svg)

## Usage

Basic usage of this module is as follows:

```hcl
module "log_analysis" {
  source  = "GoogleCloudPlatform/log-analysis/google"
  version = "~> 0.5"

  project_id  = "<PROJECT ID>"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| delete\_contents\_on\_destroy | If set to true, delete all BQ resources. | `bool` | `false` | no |
| deployment\_name | The name used to provision resources with. | `string` | `"log-analysis"` | no |
| enable\_apis | Whether or not to enable underlying apis in this solution. | `string` | `true` | no |
| labels | A set of key/value label pairs to assign to the resources deployed by this blueprint. | `map(string)` | `{}` | no |
| project\_id | The project ID to provision resources to. | `string` | n/a | yes |
| region | The Google Cloud region name to provision resources in. | `string` | `"us-central1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| bigquery\_dataset\_name | The BigQuery dataset name which the transferred log table is in |
| bigquery\_dataset\_url | The URL to the dataset in the BigQuery UI where you see the tables for logs stored |
| bigquery\_table\_name | The BigQuery table name for transferred logs |
| bucket\_name | The Cloud Storage bucket to ingest logs from external soruces |
| datastudio\_report\_url | The URL to create a new Looker Studio report that runs queries against the table for transferred logs via BigQuery Data Trasfer Service |
| deployment\_id | The random ID generated for each deployment |

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
- Service Account Admin: `roles/iam.serviceAccountAdmin`
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
