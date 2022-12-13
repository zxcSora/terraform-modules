variable "server_name" {
  description = "Имя создаваемой VPS в облаке Cloud Provider'a"
  type        = string
  default     = ""
}

variable "server_image" {
  description = "Образ операционной системы на создаваемой VPS"
  type        = string
  default     = "debian-11"
}

variable "server_type" {
  description = "Тип сервера, который определяет характеристики VPS"
  type        = string
  default     = ""
}
// cx11  = 1  CPU, 2GB RAM,  20GB SSD
// cpx11 = 2  CPU, 2GB RAM,  40GB SSD
// cx21  = 2  CPU, 4GB RAM,  40GB SSD
// cpx21 = 3  CPU, 4GB RAM,  80GB SSD
// cx31  = 2  CPU, 8GB RAM,  80GB SSD
// cpx31 = 4  CPU, 8GB RAM,  160GB SSD
// cx41  = 4  CPU, 16GB RAM, 160GB SSD
// cpx41 = 8  CPU, 16GB RAM, 240GB SSD
// cx51  = 8  CPU, 32GB RAM, 240GB SSD
// cpx51 = 16 CPU, 32GB RAM, 360GB SSD


variable "server_datacenter" {
  description = "Датацентр облачного провайдера, в котором будет создана VPS"
  type        = string
  default     = ""
}
// nbg1-{{ 1-5 }}
// fsn1-{{ 1-18 }}
// hel1-{{ 1-6 }}

variable "labels" {
  description = "Словарь в котором передаются лейблы в формате ключ = значение"
  type        = map(any)
  default     = {}
}

variable "volumes" {
  description = "Словарь в котором передаётся информация о дисках, которые мы ходим создать и подключить к VPS в формате ключ = значение"
  type        = map(any)
  default     = {}
}

variable "hetzner_cloud_token" {
  description = "API токен, который используется для подключение к Hetzner Cloud"
  type        = string
  default     = ""
}

variable "server_network" {
  description = "Словарь в котором передаётся ID локальной сети, в которую подключить создаваемую VPS и какой адрес ей присвоить в формате ключ = значение"
  type        = map(any)
  default     = {}
}

data "template_file" "ansible_user_data" {
  #template = file("../module/scripts/user.yaml")
  template = file(var.cloud_init_file_path)
}
variable "server_ssh_keys" {
  description = "Список SSH ключей, которые будут загружены в виртуальную машину. По умолчанию кладётся ключ ansible, Деревяшкина, Сидорова, Яблуновской, Летягина, Лопатина, Евсюкова, Железцова"
  type        = list(any)
  default     = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjkR4kxEQTHtiTA4LXsx80jv86zKYrrLG9yy8ay6GFmI+BRVZ65wI8EQsygg0K1/vqgfcTvA5HwSW4CusaZyZDwd18hC50MNF1CM33OVwR3OF2Thd0cyjyF0jr8oevxoRUAL/GFkyfNvK7eC5hYjDHKMleXZscX6fg0oMbGeYCXErtSQ0Kk4ea3DL+qDc2ssp2ij5Yx0axE+LxdLjUU/MLwmvEO115xtdDlFFOHjv2DE/638PLTmaHgXuEGdgRkj1kwzeAY2/bZ+MjSZ6Jgd1ibF7bJ1hdDQ9c+P9DutjrP5na7C1XYo63xFJNQRXq9N6AHG8wVA82SHk7J2WZbz/Hz", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCu50t0V2yEi4hE0cFzeYa6YldhG8MXunCOOrwZ+inXNVeIfzEG9hb5By8snbW6hvrk2TK6WYD+kyk5C+4wzKH8R8+xhBYD+PtwplRlBdW7tu/oEpvwlQKdVGMnco0ssgxKSUal7XAViR2yJNiptUNy4KISC+IaeWkoKzAn3dkTokZVELbAyjbsgDGJU+tAStyQu0AhySCAjFBWBvwUDPdvtWjn5NqczfOA4BjMRKL8HlLyX4ggOXq/1TPGvdDuLYS+XrsTw1TTRu5FtTQMi/wjkxND9aOfVgc2y+pFsJ1+736afipbmsN1+fn4AF2mcHG/8ZZQ0bDH9k8wOzZPmIdB ad_yablunovskaya@yablunovskaya-pcz", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDBATlvyzNr0ypS+mer+3hVziBOTZP63VtBv1acferZfRwFS7ajw4QG0kd3FrRUamKIcHcp/c9vr76C/wlF5l3tI7dxMRRKaWCQysXEpWyV4BRVfNtQgmZsh2eY12q8RaDD6YFjv5MHbQRCBQnGuxCBve/vgyeUxf8wUfqrnosbGK5PbCe0+VQGq05EZGg+mN9butiI2NeD9JX8NI9ecRMhxilTGdS8xPF32T+5ULE7NOWIk3JgXlAcdQ7JhGbUajud6GmKlhQF/7xVtsvH7widJWVkIeToVVDdpd5u5+IFFe2HrtHBwJKyV0czBerM9JADxdL7QzFY+cHP68Hbn3Bb1nLQjpCwVUFFVIM56vt8tky2bsZTEONnVf0BfvjKqpjBocDD+TNqsq2SputdbwrRkMraphPCzVZB8VJMcsySaRr/LK7NcYWsKahHvpg3/pEBSdFXbumW9Um9gEJzo1HLJj/c7wuhqNePASCx4gFCppmtEH+CLY1x1CQjWwXF1zLwEgU6LBqXyLqRtUhVnqN0Zf44YZxnCeNZdk5P28RrlxzSDelR96l/UOQpbSIDXaZw6MJBTHMo3gR87iYSPbAInKUz5eiDErtCbKndIgp9tSfEoRuV1BA8PalNRYX8io7hLXjGW7+JvUOsw8uZODAPq+nRFCiyGfqau1FE4Lb+RQ==z", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC100jc/9ghNknwkcxWCrJPU/fXsifTyX6J6z6zAQHq8LImnDs5VkxhiWhBbTE3jYEHj+yaadUhe299aSDZPIsnMnax21lIRO7jgdeSPydSPhcEILUY3H1PfWgbue04xg1/IrNSk5qh8zK8keMpuhnUvTw+p1QWsGt98/oqmjUqBJ3GMX7ICBlQ4r4bJgNrYfk+I1RwlrYuk1+ZI/VauuzCl0CxJRQNwmOcFa3PSVRblmeVmS6kVfWm2U8f0hCJQMnUTJntm9Lt1kjPAzzAesusLj6T+KJdCVzIoNjTvmFz6mYNAEFnj7bwhxf8BUAYtD9H6CFSnTb9RscU/uPIuBx22m8pZ8SJOuaIBO6G20Vn1RrHnXXeynaz96gZI7/vob+uusQlcxdXwFVwb62GuBdnpuyFkOYLciXaFpupe/X3+r7A+uwwlqFiHZSU5Q80N+FzJjHjCwU5xzcB5yUyuIRvYHS+w8n6GhKNH/ywnNF8JZ6SOLEADGGpzPdOOAOBqirYBYcizjhEdQ3oyHg79xSkPa7Hkvtqnhd2bTgbCx1n/XsPrukMGU0fQH6Xcb8kThFsJootzL+l+M5Yqw326K2GF9H/fkMI623qXndsixcVAP3wS+PGL9uvRFlY9fG1Dw5u4F+HDpbpa0qY0GLPFhLbwuoHFGtTljp3gGpGlBXPSQ==z", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDoKj6a+4/0WdD7F7SI+LlR+3ZSDs1m/gLwm5GYM1neOkMeEhVLcQh4Tu6V6OnvDxyqnTECJUlUzFVAtywX9GaFl1K3q5XewH9YmllEbuvsXtpMWxLCvGwb+HP78dQDjAQjb8dTJexbSEqEdwjevz7THhTC9+ylfZXzkGJwRPx7yLsrZd2DCMvZbg3S4dLaBTXdZyAiyi/RBEegkEJyEMZIw3QeoLVQf4V/qyzDP8dz8DoVCOqS2cnQsfhA6FnAH3mtHaA4JivjSJX0F7MvWB4VRlwKbHcAj1GsAO2d9QtEUxFEpWxv/GWLU8f6Tk/tYP46uf7En4t4yXeRxrkWaOirz", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjJIfYqX8lZm26KJVo0zldE1uwL9NtO6UAngo4qOJdyXICKt6NxEvhO9bD9Wcg4X5HNKUkwkUJb+p4qCfq2W+VjuHFeojRkKT7l8PfaskMrjHBWRzAOcYYe4Rivc/gpeNMOvfcZN3/ajNWRWMYLFroIWmfYDxNWtLArleliRWAqgEXHGZ/PVFKZZHGTaGWDyTgQcDbxY7rnW1QtuZz022ZvCYSLYo/Fx9mnlixHUpGQ+NAoNMPNXClxRB5IOBwinKtj1bs1bn7ySHNuIvQjlNaozwn+w58w9KSjA6U2m4rOF37CTLceuefdsOwqYwBMkv8/615e7EmCh9yen+CczVTz", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDU+EOwq3aBL9i8+DINuEms8pGTQDww7VBK/b8hsDp50iO5j6gMZZRByyF2O3Pz91Tq/6YBnjSb/NpGI0zUAfgRrkZWKijRM61NgmcXWG8QcNX3ILDlzbT3JISaH5s8JxsVqHhcdmTRrMaAYuLfaIWJPhhAuxOEgnnpqNVivuwQ5foBShJ/alQThYfc221CkR6TBsAiGmNWixGCl/OnRRjzsjwbxi/RUvyczcChXHXGbqxl+PpFY4jKXjnO9bh7a76D9PzZIZ42Y+yMdHUrda51qz3kU5V7st9HcrDyLnTY2dKMKf6h6zycRI00zfa/ISKtr1AM3tVQ+Yos4SokLeKlHykMpNFgmMEDJj8SOcQmEZYUT75bEPuHeZxqGQuOfnxi9Ydq6qOUmQyudJoEDjx0n9mC3UZiHtkFHzHhIxVTrD8SRSeMYlNIHCH7chxLa7ZBgZbBTHfyVTjUZlCIwlche7j9sqpyZyPy877IDMtO5x4rnCt5mQ2mqwk1wbX/YnU= ea_letyaginz", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzsHMFACUtW1LuL3HWHHW8R9enGTr5AJlwuYpL1aAjUOygIfjbe/siewudxXuys5N127Ea7CfcGNnhmO1XfPcLsImlGmPyMg+AY6W295nmHWEjbHf/erqC5u2SdHtu78qKuydT79Xvrk3CaV6Ywfkd4MQpGmVJZe62X4MYrO+M0zEjAK29JMfPzlYdQ5vam1HbueFybWefOWdlrejr08+9TilWa1QSQDvuAdw8T6MTyX+m7RMH3BhE0xKUPzb7IWTKZFYL/W7t16//Qut7cZlCf1rdduluXwEeLsADCFbM0XU74DVjtH3nR0Ri/D7qPMum6jNM9V/4djYLDX/aksgn", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDBWBcgaTQOcQ+EoYjKnHdoJr7S4cuhpL9qORdjjDrpQDEFL7n2/VV6XnIn5vHJ9A9U3KDBU63X1jQJswH77EGfNiovUooQLS/J7kc7ZsD1PRklxdPN3qOrHNItpa7YwEr85mhU8HHle+JZben6Vndgu0X9mAnEP9iVciCW/kqBt1gN5nWXYRBjISUlqTg2lVHow4HIEcpAswZdYvXpDrLtEISC/2dWhLLu3PQ4dzVDGE6yUcd1/cw2esuzC/W0C7680MOL0iZS7f+LBVJhx+YQd298pcRbfInl1TJxDcs0/wueKatwdccn1qdUNkw5jCv+8NxCLCBnxXkjDkdVP77D87TLTVkxaCoBWr28rm0liMEFTKUpPuf5bg61PYmOzAf0WlXJFVNoKRQp2UhtvRGXK5aRTXIu8VbOjOeVhBD20/JxABJyWo9jOM2ASMTZlCmOYfkSpJlmd6bM0DMcqgLpjFunFj7Y/RqwpgsD7A3/Ysx+yO0v9EjnWy8blU4TnBnWAqsSuVg2wUZevAJekxm89oYvSqms/yikktng83e4iDDmuYfHLCGusTkeKBMZkOmCWq4HVSTWqxmiVRVk5BeMFgGyajmFi6D2ieILUlz1gp7aV8WsHko51JEvbjPlQGdhc2EBAm3wdc3s2Z+PMK3i0VKKlNt5ztwBCwmshYXsSw== openpgp:0x2A468F71", "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKj7Ykh6x+Y5bgcahvVSiV+ThhM/kcJQd1t9PEPazGLS openpgp:0x2A468F71"]
}

variable "volume_filesystem" {
  description = "Файловая система для диска, монтируемого к создаемой VPS"
  type        = string
  default     = "ext4"
}

variable "cloud_init_file_path" {
  description = "Относительный путь до файла cloud init"
  type        = string
  default     = "./modules/hetzner_server/scripts/user.yaml"
}
