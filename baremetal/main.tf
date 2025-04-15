variable "gpu_server_type" {
  description = "GPU server type"
  type        = string
}

variable "device_details" {
  description = "Input as a JSON object"
  type        = any
}

output "gpu_server_type" {
  description = "The GPU server type"
  value       = var.gpu_server_type
}

output "device_details" {
  description = "Raw device details JSON blob"
  value       = var.device_details
}
