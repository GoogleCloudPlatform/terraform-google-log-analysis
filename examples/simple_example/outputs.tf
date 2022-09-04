/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "bucket_name" {
  value       = module.log_analysis.bucket_name
  description = "The Cloud Storage bucket to ingest logs from external soruces"
}

output "bigquery_dataset_name" {
  value       = module.log_analysis.bigquery_dataset_name
  description = "The BigQuery dataset name which the transferred log table is in"
}

output "bigquery_table_name" {
  value       = module.log_analysis.bigquery_table_name
  description = "The BigQuery table name for transferred logs"
}

output "bigquery_dataset_url" {
  value       = module.log_analysis.bigquery_dataset_url
  description = "The URL to the dataset in the BigQuery UI where you see the tables for logs stored"
}

output "datastudio_report_url" {
  value       = module.log_analysis.datastudio_report_url
  description = "The URL to create a new Data Studio report that runs queries against the table for transferred logs via BigQuery Data Trasfer Service"
}

output "cloud_run_url" {
  value       = module.cloud_run.service_url
  description = "The public URL on which the deployed example website is available"
}
