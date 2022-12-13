output "instance_ip_address" {
  description = "Возвращает адрес создаваемой VPS"
  value       = hcloud_server.vps.ipv4_address
}

output "instance_name" {
  description = "Возвращает имя VPS"
  value       = hcloud_server.vps.name
}

output "instance_volume" {
  description = "Возвращает информацию о дополнительных дисках, подключаемых к VPS"
  value = {
    for key, value in hcloud_volume.volume : key => value.size
  }
}
output "instance_network" {
  description = "Возвращает информацию о сетях, подключаемых к VPS"
  value = {
    for key, value in hcloud_server_network.network : key => value.ip
  }
}
output "ssh_connect_shortcut" {
  description = "Возвращает команду для подключения по SSH к создаваемой VPS"
  value       = "ssh ansible@${hcloud_server.vps.ipv4_address} -i ~/.ssh/id_rsa"
}
