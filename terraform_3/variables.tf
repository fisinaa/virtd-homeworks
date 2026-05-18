###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}
### vm_web vars
variable "vm_web_family" {
  type    = string
  default = "ubuntu-2004-lts"
}
variable "vm_web_name" {
  type    = string
  default = "web"
}
variable "vm_web_platform_id" {
  type    = string
  default = "standard-v1"
}
variable "vm_web_count" {
  type    = number
  default = 2
}
variable "vm_web_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }
}

### vm_db vars
variable "vm_db_platform_id" {
  type    = string
  default = "standard-v1"
}
variable "vm_db_core_fraction" {
  type    = number
  default = 20
}
variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 2
      disk_volume = 5
    },
    {
      vm_name     = "replica"
      cpu         = 4
      ram         = 4
      disk_volume = 10
    }
  ]
}
### storage vars
variable "storage_disk_count" {
  type    = number
  default = 3
}
variable "storage_disk_size" {
  type    = number
  default = 1
}
variable "vm_storage_name" {
  type    = string
  default = "storage"
}
variable "vm_storage_platform_id" {
  type    = string
  default = "standard-v1"
}
variable "vm_storage_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }
}
