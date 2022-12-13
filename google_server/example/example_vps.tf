module "vps-test" {
  source             = "../module"
  server_name        = "example-vps"
  server_description = "simple vps for module testing"
  server_type        = "e2-small"
  server_region      = "europe-west4"
  server_datacenter  = "europe-west4-c"
  server_labels = {
    project     = "terraform"
    environment = "test"
  }
  server_metadata = {
    groups = "parent_group.child_group"
  }
  boot_volume_image = "debian-cloud/debian-11"
  boot_volume_size  = 30
  boot_volume_labels = {
    environment = "production"
    project     = "v3"
    type        = "system"
  }
  server_tags              = ["postgres", "production", "disable-gce-firewall"]
  server_delete_protection = true
  server_network = {
    common_network = {
      subnetwork_name = (data.terraform_remote_state.network.outputs.subnetwork_vpc_production_common_name)
    },
    custom_network = {
      subnetwork_name = "10.10.0.1/24"
    }
  }
  volumes = {
    volume_data1 = {
      volume_name = "v3-postgres-saga-import-test-storage"
      volume_size = "40"
      volume_type = "pd-ssd"
      volume_labels = {
        environment = "production"
        project     = "v3"
        type        = "storage"
      }
    },
    volume_data2 = {
      volume_name = "volume-vpstest2"
      volume_size = "20"
      volume_type = "pd-ssd"
      volume_labels = {
        environment = "production"
        project     = "v2"
        type        = "storage"
      }
    }
  }
}

