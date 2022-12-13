
resource "hcloud_network" "network" {
  name     = var.network_name
  ip_range = var.network_range
}

resource "hcloud_network_subnet" "subnet" {
  count        = length(var.subnet_ip_range)
  network_id   = hcloud_network.network.id
  type         = var.subnet_type
  network_zone = var.subnet_zone
  ip_range     = element(var.subnet_ip_range, count.index)
}

resource "hcloud_network_route" "route" {
  for_each    = var.routes
  network_id  = hcloud_network.network.id
  destination = tostring(each.key)
  gateway     = tostring(each.value)
}
