# Модуль hetzner_network

Создаёт сеть в Hetzner Cloud.

- Входные данные описаны в [variables.tf](./module/variables.tf)

- Выходные данные описаны в [outputs.tf](./module/outputs.tf)

- Пример использования [example](./example/example_vps.tf)

Чтобы использовать несколько сущностей провайдера (аккаунты и проекты в Hetzner), то нужно вызывать модуль и в переменную ```hetzner_cloud_token``` токен нужного провайдера. Так как, скорее всего, бы будете использовать токен провайдера из файла, то нужно объявить секретную переменную в файле input.tf.

### Маршруты
Передаются в формате:
```json
routes {
  destionation_network = gateway
}
```
Пример:

```json

module "network-test1" {
  source          = "../module"
  network_name    = "module-test-network1"
  network_range   = "10.199.0.0/16"
  subnet_zone     = "eu-central"
  subnet_ip_range = ["10.199.10.0/24", "10.199.15.0/24"]
  routes = {
    "10.199.20.0/24" = "10.199.10.2"
  }
  hetzner_cloud_token = var.hetzner_cloud_offline_main_api_token
}

module "network-test2" {
  source        = "../module"
  network_name  = "module-test-network2"
  network_range = "10.198.0.0/16"
  subnet_zone     = "eu-central"
  subnet_ip_range = ["10.199.20.0/24", "10.199.25.0/24"]
  routes = {
    "10.199.10.0/24" = "10.199.20.2"
  }
  hetzner_cloud_token = var.hetzner_cloud_offline_main_api_token
}

```
