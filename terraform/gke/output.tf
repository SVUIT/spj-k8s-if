# References: 
#   https://cloud.google.com/kubernetes-engine/docs/concepts/configuration-overview

output "stable_channel_default_version" {
  value = data.google_container_engine_versions.central1c.release_channel_default_version["STABLE"]
}

output "stable_channel_latest_version" {
  value = data.google_container_engine_versions.central1c.release_channel_latest_version["STABLE"]
}

output "regular_channel_default_version" {
  value = data.google_container_engine_versions.central1c.release_channel_default_version["REGULAR"]
}

output "regular_channel_latest_version" {
  value = data.google_container_engine_versions.central1c.release_channel_latest_version["REGULAR"]
}