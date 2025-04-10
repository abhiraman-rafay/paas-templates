variable "nodes" {
  description = "Node details as a map keyed by hostname"
  type = map(object({
    arch              = optional(string, "amd64")
    hostname          = string
    private_ip        = string
    kubelet_extra_args = optional(map(string), {})
    operating_system  = optional(string, "Ubuntu22.04")
    roles             = optional(list(string), [])
    ssh = object({
      ip_address       = string
      port             = optional(string, "22")
      private_key_path = string
      username         = string
    })
  }))

  default = {
    "hostname-1" = {
      arch              = "amd64"
      hostname          = "hostname-1"
      private_ip        = "10.1.0.67"
      kubelet_extra_args = {
        "max-pods"                    = "300"
        "cpu-manager-reconcile-period" = "30s"
      }
      operating_system  = "Ubuntu22.04"
      roles             = ["ControlPlane", "Worker"]
      ssh = {
        ip_address       = "129.146.178.0"
        port             = "22"
        private_key_path = "private-key"
        username         = "ubuntu"
      }
    }
  }
}


variable "private_key" {
  description = "Private key"
  type        = string
  default     = "..sssh"
}

variable "noofnodes" {
  description = "Number of nodes"
  type        = number
  default     = 1
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

variable "memory" {
  description = "Memory per node in MB"
  type        = number
  default     = 8192
}

variable "storage" {
  description = "Storage per node in GB"
  type        = number
  default     = 100
}

output "nodes" {
  value = var.nodes
}

output "private_key" {
  value     = var.private_key
  sensitive = true
}
