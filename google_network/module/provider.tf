terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.51.0"
    }
  }
}
provider "google" {
  project     = "bb-prod-ground"
  credentials = file("../../../../main/vault/prod/.tf/terraform-bb-prod-ground.json")
}
