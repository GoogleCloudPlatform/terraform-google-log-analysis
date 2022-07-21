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
  value       = google_storage_bucket.ingest_bucket.name
  description = "The Cloud Storage bucket to ingest logs from external soruces"
}

output "bigquery_dataset_name" {
  value       = module.log_destination.resource_name
  description = "The BigQuery dataset name which the transferred log table is in"
}

output "bigquery_table_name" {
  value       = google_bigquery_table.bigquery_data_transfer_destination.table_id
  description = "The BigQuery table name for transferred logs"
}

output "cloud_run_url" {
  value       = google_cloud_run_service.example_website.status[0].url
  description = "The public URL on which the deployed example website is available"
}
