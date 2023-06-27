# Simple Example

This example illustrates how to use the `log-analysis` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| delete\_contents\_on\_destroy | If set to true, delete all the tables in the dataset. | `bool` | `false` | no |
| deployment\_name | The name used to provision resources with. | `string` | `"log-analysis"` | no |
| labels | A set of key/value label pairs to assign to the resources deployed by this blueprint. | `map(string)` | `{}` | no |
| project\_id | The ID of the project in which to provision resources. | `string` | n/a | yes |
| region | The Google Cloud region name to provision resources in | `string` | `"us-central1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| bigquery\_dataset\_name | The BigQuery dataset name which the transferred log table is in |
| bigquery\_dataset\_url | The URL to the dataset in the BigQuery UI where you see the tables for logs stored |
| bigquery\_table\_name | The BigQuery table name for transferred logs |
| bucket\_name | The Cloud Storage bucket to ingest logs from external soruces |
| cloud\_run\_url | The public URL on which the deployed example website is available |
| datastudio\_report\_url | The URL to create a new Looker Studio report that runs queries against the table for transferred logs via BigQuery Data Trasfer Service |
| neos\_tutorial\_url | The URL to launch the in-console tutorial for the Log analysis pipeline solution |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
