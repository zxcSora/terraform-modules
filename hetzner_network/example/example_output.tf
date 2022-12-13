output "network" {
  description = "Возвращает информацию о создаваемой сети"
  value       = module.network-test1.networks
}
output "routes" {
  description = "Возвращает информацию о создаваемой сети"
  value       = module.network-test1.routes
}
