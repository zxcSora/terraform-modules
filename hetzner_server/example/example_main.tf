terraform {
  backend "gcs" {
    bucket      = "betboom-terraform-state"
    credentials = "../../../../main/vault/prod/.tf/terraform-bb-prod-ground.json"
    prefix      = "offline-resource-v3-test-testvps"
  }
}
