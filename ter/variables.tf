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

variable "vms_family" {
  type        = string
  default     = "centos-7"
  description = "yandex_compute_image_family"
}

variable "vms_zone" {
  type        = string
  default     = "standard-v1"
}

variable "vm1_name" {
  type        = string
  default     = "sonar-01"
}

variable "vm2_name" {
  type        = string
  default     = "nexus-01"
}

variable "vms_resources" {
  type        = map
  default     = {
    "vm-1"    = {
      cores         = 2
      memory        = 4
      core_fraction = 5
    }
    "vm-2"    = {
      cores         = 2
      memory        = 4
      core_fraction = 5
    }
  }
  description = "yandex_compute_instance_vms_resourses"
}