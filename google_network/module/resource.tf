resource "google_compute_network" "network" {
  name                    = var.network_name
  description             = var.network_description
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "subnet" {
  for_each      = var.subnets
  name          = each.value["subnet_name"]
  region        = each.value["subnet_region"]
  ip_cidr_range = each.value["subnet_ip_range"]
  network       = google_compute_network.network.self_link
  secondary_ip_range = [
    for i in range(
      length(
        contains(
        keys(var.additional_ip_ranges), each.value.subnet_name) == true
        ? var.additional_ip_ranges[each.value.subnet_name]
        : []
    )) :
    var.additional_ip_ranges[each.value.subnet_name][i]
  ]
}
