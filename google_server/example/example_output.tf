output "instance_ip_address" {
  description = "Возвращает адрес создаваемой VPS"
  value       = module.vps-test.ssh_connect_shortcut

}
output "instance_volume" {
  description = "Возвращает информацию о дополнительных дисках, подключаемых к VPS"
  value       = module.vps-test.instance_volume
}
