output "ssh_connect_shortcut" {
  description = "Возвращает команду для подключения по SSH к создаваемой VPS"
  value       = "ssh ansible@${google_compute_address.static_ip.address} -i ~/.ssh/id_rsa_ansible1"
}
output "instance_volume" {
  description = "Возвращает информацию о дополнительных дисках, подключаемых к VPS"
  value = {
    for key, value in google_compute_disk.volume : key => value.size
  }
}
output "instance_name" {
  description = "Возвращает имя VPS"
  value       = google_compute_instance.vps.name
}
