# References:
#   https://developer.hashicorp.com/terraform/language/values/variables

variable "gke_zone" {
  default = "us-central1-c"
  description = "GKE zone"
}

variable "gke_project" {
  description = "GKE project"
  default = "magnetic-blade-436316-f5"
}

variable "gke_sa" {
  description = "GKE service account"
  default = "gke-svuit-sa"
}

variable "gke_region" {
  description = "GKE region"
  default = "us-central1"
}

variable "gke_credential" {
  description = "GKE Service account credential"
  default = "gke-svuit.json"
}

variable "gke_name" {
  description = "GKE name"
  default = "gke-svuit"
}

variable "gke_display_name" {
  description = "GKE display name"
  default = "GKE_SVUIT_SA"
}

variable "node_type" {
  description = "GKE node machine type"
  default = "e2-medium"
}

variable "node_count" {
  description = "GKE node count" 
  default = 2
}

variable "node_size" {
  description = "GKE node size" 
  default = 40
}
