
module "network-test1" {
  source          = "../module"
  network_name    = "module-test-network1"
  network_range   = "10.199.0.0/16"
  subnet_zone     = "eu-central"
  subnet_ip_range = ["10.199.10.0/24", "10.199.15.0/24"]
  routes = {
    "10.199.20.0/24" = "10.199.10.2"
  }
  hetzner_cloud_token = var.hetzner_cloud_offline_main_api_token
}

module "network-test2" {
  source          = "../module"
  network_name    = "module-test-network2"
  network_range   = "10.198.0.0/16"
  subnet_zone     = "eu-central"
  subnet_ip_range = ["10.199.20.0/24", "10.199.25.0/24"]
  routes = {
    "10.199.10.0/24" = "10.199.20.2"
  }
  hetzner_cloud_token = var.hetzner_cloud_offline_main_api_token
}
