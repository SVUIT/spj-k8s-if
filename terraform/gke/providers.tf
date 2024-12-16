# References:
#   https://registry.terraform.io/providers/hashicorp/google/latest

provider "google" {
    project = var.gke_project
    region = var.gke_region
    credentials = var.gke_credential
}
