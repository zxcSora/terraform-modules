variable "hetzner_cloud_offline_main_api_token" {}
variable "hetzner_cloud_offline_kz_test_api_token" {
}
data "terraform_remote_state" "htz_network" {
  backend = "gcs"
  config = {
    bucket      = "betboom-terraform-state"
    credentials = "../../../../main/vault/prod/.tf/terraform-bb-prod-ground.json"
    prefix      = "offline-resource-hetzner-network"
  }
}
