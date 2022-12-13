output "networks" {
  description = "Возвращает информацию о создаваемых сетях"
  value       = <<EOT
    Network: ${hcloud_network.network.name}:${hcloud_network.network.ip_range}
      Subnets: %{for range in hcloud_network_subnet.subnet[*].ip_range}
          ${range}
  %{endfor}
  EOT
}
output "routes" {
  description = "Возвращает информацию о создаваемых маршрутах"
  value = {
    for key, value in hcloud_network_route.route : key => value.gateway
  }
}
