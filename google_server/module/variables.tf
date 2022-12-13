variable "server_name" {
  description = "Имя создаваемой VPS в облаке Cloud Provider'a"
  type        = string
  default     = ""
}

variable "server_description" {
  description = "Описание создаваемой VPS в облаке Cloud Provider'a"
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
  default     = "e2-small"
}

variable "server_datacenter" {
  description = "Датацентр облачного провайдера, в котором будет создана VPS"
  type        = string
  default     = "europe-west4-c"
}
variable "server_region" {
  description = "Регион облачного провайдера"
  type        = string
  default     = "europe-west4"
}
variable "server_delete_protection" {
  description = "Защита от случайного удаления (Чтобы отключить нужно идти в web интерфейс и снять галочку)"
  type        = bool
  default     = true
}

variable "server_labels" {
  description = "Словарь в котором передаются лейблы в формате ключ = значение"
  type        = map(any)
  default     = {}
}

variable "server_metadata" {
  description = "Словарь в котором передаётся метадата в формате ключ = значение"
  type        = map(any)
  default     = {}
}
variable "server_tags" {
  description = "Лист в котором передаются теги"
  type        = list(any)
  default     = []
}
variable "server_network" {
  description = "Локальная сеть подключаемая к VPS"
  type        = map(any)
  default = {
    default = {
      subnetwork_name = default
    }
  }
}
variable "boot_volume_size" {
  description = "Размер загрузочного диска"
  type        = string
  default     = "50"
}
variable "boot_volume_type" {
  description = "Тип загрузочного диска"
  type        = string
  default     = "pd-ssd"
}
variable "boot_volume_image" {
  description = "Образ загрузочного диска"
  type        = string
  default     = "debian-cloud/debian-11"
}
variable "boot_volume_labels" {
  description = "Словарь в котором передаются лейблы для загрузочного диска в формате ключ = значение"
  type        = map(any)
  default     = {}
}
variable "volumes" {
  description = "Словарь в котором передаются имя и размер дополнительного диска в формате ключ = значение"
  type        = map(any)
  default     = {}
}
