resource "hcloud_server" "vps" {
  name        = var.server_name
  image       = var.server_image
  server_type = var.server_type
  datacenter  = var.server_datacenter
  user_data   = data.template_file.ansible_user_data.rendered
  labels      = var.labels
}

resource "hcloud_volume" "volume" {
  for_each  = var.volumes
  name      = tostring(each.key)
  size      = tonumber(each.value)
  server_id = hcloud_server.vps.id
  automount = true
  format    = var.volume_filesystem
}

resource "hcloud_server_network" "network" {
  for_each  = var.server_network
  server_id = hcloud_server.vps.id
  subnet_id = each.value["subnet_id"]
  ip        = tostring(each.value["ip"])
}
