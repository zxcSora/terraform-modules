variable "hetzner_cloud_token" {
  description = "API токен, который используется для подключение к Hetzner Cloud"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "Имя сети"
  type        = string
  default     = ""
}

variable "network_range" {
  description = "Диапозон сети"
  type        = string
  default     = ""
}

variable "subnet_ip_range" {
  description = "Диапозон подсети"
  type        = list(any)
  default     = []
}

variable "subnet_zone" {
  description = "Зона подсети"
  type        = string
  default     = ""
}

variable "subnet_type" {
  description = "Тип подсети: server / cloud / vswitch"
  type        = string
  default     = "cloud"
}

variable "routes" {
  description = "Маршруты, которые будут добавлены в создаваемую сеть в формате destination = gateway"
  type        = map(any)
  default     = {}
}
