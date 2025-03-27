variable "ssh_key" {
  description = "Private key"
  type        = string
  default     = "..sssh"
}

variable "cpu" {
  description = "Number of CPU cores per node"
  type        = number
  default     = 4
}

variable "gpu" {
  description = "Number of GPUs per node"
  type        = number
  default     = 0
}

variable "memory_gb" {
  description = "Memory per node in GB"
  type        = number
  default     = 8192
}

variable "storage_gb" {
  description = "Storage per node in GB"
  type        = number
  default     = 100
}

variable "gpu_type" {}
variable "gpu_vendor" {}
variable "gpu_model" {}


output "private_key" {
  value     = var.ssh_key
  sensitive = true
}
