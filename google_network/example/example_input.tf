
# data "terraform_remote_state" "network" {
#   backend = "gcs"
#   config = {
#     bucket      = "betboom-terraform-state"
#     credentials = "../../../../main/vault/prod/.tf/terraform-bb-prod-ground.json"
#     prefix      = "offline-resource-networks-prod-network"
#   }
# }
