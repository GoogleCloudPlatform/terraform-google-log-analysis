# Simple Example

This example illustrates how to use the `log-analysis` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The ID of the project in which to provision resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bigquery\_dataset\_name | The BigQuery dataset name which the transferred log table is in |
| bigquery\_table\_name | The BigQuery table name for transferred logs |
| bucket\_name | The Cloud Storage bucket to ingest logs from external soruces |
| cloud\_run\_url | The public URL on which the deployed example website is available |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
