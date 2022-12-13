variable "network_name" {
  description = "Имя сети"
  type        = string
  default     = ""
}
variable "network_description" {
  description = "Описание сети"
  type        = string
  default     = ""
}

variable "auto_create_subnetworks" {
  description = "Автоматически создать подсети"
  type        = bool
  default     = false
}

variable "subnets" {
  description = "value"
  type        = map(any)
  default     = {}
}

variable "additional_ip_ranges" {
  description = "value"
  type        = map(any)
  default     = {}
}
