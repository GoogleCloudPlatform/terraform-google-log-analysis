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

data "google_project" "project" {
  project_id = var.project_id
}

// Enable APIs required
module "project-services" {
  source     = "terraform-google-modules/project-factory/google//modules/project_services"
  version    = "~> 12.0"
  project_id = var.project_id
  enable_apis = var.enable_apis
  activate_apis = [
    "iam.googleapis.com",
    "storage-api.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "run.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerydatatransfer.googleapis.com"
  ]
  disable_services_on_destroy = false
}

// Terraform plugin for creating random IDs
resource "random_id" "instance_id" {
  byte_length = 8
}

// Create a Cloud Storage bucket for ingesting external log data to transfer to BigQuery
resource "google_storage_bucket" "ingest_bucket" {
  name     = "${replace(var.deployment_name,"_","-")}-ingest-${random_id.instance_id.hex}"
  location = var.region
  labels   = var.labels
}

// Copy a sample file to the bucket created
resource "google_storage_bucket_object" "sample_data" {
  depends_on = [
    google_storage_bucket.ingest_bucket
  ]
  name   = "sample_access_log.json"
  source = "${path.module}/sample_access_log.json"
  bucket = resource.google_storage_bucket.ingest_bucket.name
}

# Set up Logs Router to route Cloud Run web access logs to BigQuery
module "log_export" {
  source                 = "terraform-google-modules/log-export/google"
  version                = "~> 7.4"

  destination_uri        = module.log_destination.destination_uri
  filter                 = "log_name=~\".*run.googleapis.com%2Frequests.*\""
  log_sink_name          = "bigquery_example_logsink"
  parent_resource_id     = var.project_id
  parent_resource_type   = "project"
  unique_writer_identity = true
  bigquery_options = {
    use_partitioned_tables = true
  }
}

# Configure a Cloud Logging sink to route logs to BigQuery
module "log_destination" {
  source                   = "terraform-google-modules/log-export/google//modules/bigquery"
  version                  = "~> 7.4"

  project_id               = var.project_id
  dataset_name             =  "${replace(var.deployment_name,"-","_")}_logsink"
  location = var.region
  log_sink_writer_identity = module.log_export.writer_identity
  labels                   = var.labels
}

# Create a Service Account for Bigquery Data Transfer jobs
resource "google_service_account" "bigquery_data_transfer_service" {
  depends_on = [
    module.project-services.project_id
  ]
  account_id   = "bigquery-data-transfer-service"
  display_name = "Service Account for BigQuery Data Transfer Service"
  description  = "Used to run BigQuery Data Transfer jobs."
}

resource "google_project_iam_member" "bigquery_data_editor" {
  project = data.google_project.project.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.bigquery_data_transfer_service.email}"
}

resource "google_project_iam_member" "storage_object_viewer" {
  project = data.google_project.project.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.bigquery_data_transfer_service.email}"
}

# Set the IAM Permisions
resource "google_project_iam_member" "bigquery_data_transfer_service_permissions" {
  depends_on = [
    module.project-services.project_id
  ]
  project = data.google_project.project.project_id
  role    = "roles/iam.serviceAccountShortTermTokenMinter"
  member  = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"
}

resource "google_bigquery_table" "bigquery_data_transfer_destination" {
  depends_on = [
    module.log_destination.resource_name
  ]
  dataset_id = module.log_destination.resource_name
  table_id   = "transferred_logs"
  labels     = var.labels
  schema     = file("${path.module}/sample_access_log_schema.json")
}

# Create a BigQuery Data Transfer Service job to ingest data on Cloud Storage to Biguquery
resource "google_bigquery_data_transfer_config" "log_transfer" {
  depends_on = [
    module.log_destination.resource_name,
    google_bigquery_table.bigquery_data_transfer_destination
  ]
  display_name           = "Log ingestion from GCS to BQ"
  location = var.region
  data_source_id         = "google_cloud_storage"
  schedule               = "every day 00:00"
  destination_dataset_id = module.log_destination.resource_name
  service_account_name   = google_service_account.bigquery_data_transfer_service.email
  params = {
    data_path_template              = "gs://${resource.google_storage_bucket.ingest_bucket.name}/*.json"
    destination_table_name_template = google_bigquery_table.bigquery_data_transfer_destination.table_id
    file_format                     = "JSON"
  }
}
