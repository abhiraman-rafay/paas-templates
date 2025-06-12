variable "gputype" {
  description = "GPU server type"
  type        = string
}

variable "device_details" {
  description = "Input as a JSON object"
  type        = any
}


variable "noofNodes" {
  description = "noofNodes"
  type        = string
}

output "gputype" {
  description = "The GPU server type"
  value       = var.gputype
}

output "device_details" {
  description = "Raw device details JSON blob"
  value       = var.device_details
}
