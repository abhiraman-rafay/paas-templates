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
  default     = 8
}

variable "storage_gb" {
  description = "Storage per node in GB"
  type        = number
  default     = 100
}

variable "gpu_type" {
  description = "Type of GPU"
  type        = string
  default     = ""
}

variable "gpu_vendor" {
  description = "GPU vendor"
  type        = string
  default     = ""
}

variable "gpu_model" {
  description = "GPU model"
  type        = string
  default     = ""
}


output "private_key" {
  value     = var.ssh_key
  sensitive = true
}
