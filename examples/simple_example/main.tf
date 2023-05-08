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

module "log_analysis" {
  source  = "GoogleCloudPlatform/log-analysis/google"
  version = "~> 0.1.4"

  project_id                 = var.project_id
  region                     = var.region
  deployment_name            = var.deployment_name
  labels                     = var.labels
  delete_contents_on_destroy = var.delete_contents_on_destroy
}

# Deploy a Cloud Run service to host an example web page
module "cloud_run" {
  source  = "GoogleCloudPlatform/cloud-run/google"
  version = "~> 0.6.0"

  service_name   = "cloudrun-srv-${module.log_analysis.deployment_id}"
  project_id     = var.project_id
  location       = var.region
  service_labels = var.labels
  image          = "gcr.io/cloudrun/hello"
  members        = ["allUsers"]
}
