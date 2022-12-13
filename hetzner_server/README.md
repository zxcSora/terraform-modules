# Модуль hetzner_server

Создаёт виртуальную машину в Hetzner Cloud. В зависимости от переданных переменных подключает к ней диски, сеть.

- Входные данные описаны в [variables.tf](./module/variables.tf)

- Выходные данные описаны в [outputs.tf](./module/outputs.tf)

- Пример использования [example](./example/example_vps.tf)

Чтобы использовать несколько сущностей провайдера (аккаунты и проекты в Hetzner), то нужно вызывать модуль и в переменную ```hetzner_cloud_token``` токен нужного провайдера. Так как, скорее всего, бы будете использовать токен провайдера из файла, то нужно объявить секретную переменную в файле input.tf.

Пример:

```json
module "vps-test-main" {
  source            = "../module"
  server_name       = "vpstest"
  server_image      = "debian-11"
  server_type       = "cx21"
  server_datacenter = "fsn1-dc14"
  labels            = { groups = "test_offline.test_vps" }
  volumes = {
    volume1  = 20
    volume33 = 33
  }
  hetzner_cloud_token = var.hetzner_cloud_offline_main_api_token
}
module "vps-test-kz" {
  source            = "../module"
  server_name       = "vpstest"
  server_image      = "debian-11"
  server_type       = "cx21"
  server_datacenter = "fsn1-dc14"
  labels            = { groups = "test_offline.test_vps" }
  hetzner_cloud_token = var.hetzner_cloud_offline_kz_test_api_token
}
```
