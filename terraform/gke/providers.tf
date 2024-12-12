# References:
#   https://registry.terraform.io/providers/hashicorp/google/latest

provider "google" {
    project = "magnetic-blade-436316-f5"
    region = "us-central1"
    credentials = "gke-svuit.json"
}
