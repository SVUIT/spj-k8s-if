# References:
#   https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
#   https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
#   https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster#nested_node_config

data "google_container_engine_versions" "central1c" {
  provider       = google
  location       = var.gke_zone
}

resource "google_service_account" "default" {
  account_id   = var.gke_sa
  display_name = var.gke_display_name
  create_ignore_already_exists = false
}

resource "google_container_cluster" "primary" {
  name               = var.gke_name
  location           = data.google_container_engine_versions.central1c.location 
  min_master_version = data.google_container_engine_versions.central1c.release_channel_default_version["REGULAR"]
  node_version       = data.google_container_engine_versions.central1c.release_channel_default_version["REGULAR"]
  initial_node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = var.node_type
    disk_size_gb = var.node_size
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# resource "google_container_node_pool" "primary_preemptible_nodes" {
#   name       = "default-node-pool"
#   cluster    = google_container_cluster.primary.name
#   node_count = 1
#   location   = data.google_container_engine_versions.central1c.location 

#   node_config {
#     preemptible  = true
#     machine_type = "e2-medium"
#     disk_size_gb = 40
#     service_account = google_service_account.default.id
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }
