# This block is used to define the cloud provider and the specific configuration details for that provider.
provider "google" {
  credentials = file(var.my-credentials)
  project     = var.project-default
  region      = var.region-default
  zone        = var.zone-default
}
