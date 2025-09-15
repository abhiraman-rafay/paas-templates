variable "device_details" {
  description = "Input as a JSON object"
  type        = any
}

variable "cluster_details" {
  description = "Input as a JSON object"
  type        = string
}

variable "cpu" {
  description = "Number of CPU cores per node"
  type        = number
  default     = 4
}

variable "memoryMB" {
  description = "memoryMB"
  type        = number
}

variable "storageGB" {
  description = "storageGB"
  type        = number
}

variable "gpu" {
  description = "Number of GPUs per node"
  type        = number
  default     = 0
}

variable "gputype" {
  description = "GPU server type"
  type        = string
}

output "device_details" {
  description = "Raw device details JSON blob"
  value       = var.device_details
}
