module "vps-test" {
  source            = "../module"
  server_name       = "vpstest"
  server_image      = "debian-11"
  server_type       = "cx21"
  server_datacenter = "fsn1-dc14"
  labels            = { groups = "test_offline.test_vps" }
  server_network = {
    backend_network = {
      subnet_id = (data.terraform_remote_state.htz_network.outputs.main-subnet-id)
      ip        = "" #DHCP
    }
    custom_network = {
      subnet_id = "1867414"
      ip        = "10.10.0.8"
    }
  }
  volumes = {
    volume1  = 20
    volume33 = 33
  }
  hetzner_cloud_token  = var.hetzner_cloud_offline_main_api_token
  cloud_init_file_path = "../module/scripts/user.yaml"

}
