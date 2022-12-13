resource "google_compute_instance" "vps" {
  name                = var.server_name
  description         = var.server_description
  machine_type        = var.server_type
  zone                = var.server_datacenter
  deletion_protection = var.server_delete_protection
  labels              = var.server_labels
  metadata            = var.server_metadata
  tags                = var.server_tags

  boot_disk {
    auto_delete = false
    initialize_params {
      size   = var.boot_volume_size
      type   = var.boot_volume_type
      image  = var.boot_volume_image
      labels = var.boot_volume_labels
    }
  }
  dynamic "attached_disk" {
    for_each = var.volumes
    content {
      source = attached_disk.value["volume_name"]
    }
  }

  dynamic "network_interface" {
    for_each = var.server_network
    content {
      subnetwork = network_interface.value["subnetwork_name"]

      access_config {
        nat_ip = google_compute_address.static_ip.address
      }
    }
  }

}

resource "google_compute_disk" "volume" {
  for_each = var.volumes
  name     = each.value["volume_name"]
  type     = each.value["volume_type"]
  size     = each.value["volume_size"]
  zone     = var.server_datacenter
  labels   = each.value["volume_labels"]
}

resource "google_compute_address" "static_ip" {
  name   = var.server_name
  region = var.server_region
}
