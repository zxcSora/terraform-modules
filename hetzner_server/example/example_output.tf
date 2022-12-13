output "instance_ip_address" {
  description = "Возвращает адрес создаваемой VPS"
  value       = module.vps-test.instance_ip_address
}
output "instance_name" {
  description = "Возвращает имя VPS"
  value       = module.vps-test.instance_ip_address
}
output "instance_volume" {
  description = "Возвращает информацию о дополнительных дисках, подключаемых к VPS"
  value       = module.vps-test.instance_volume
}
output "ssh_connect_shortcut" {
  description = "Возвращает информацию о сетях, подключаемых к VPS"
  value       = module.vps-test.ssh_connect_shortcut
}
output "instance_network" {
  description = "Возвращает команду для подключения по SSH к создаваемой VPS"
  value       = module.vps-test.instance_network
}
