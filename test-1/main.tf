variable "nodes" {
  type = map(object({
    arch               = string
    hostname           = string
    operating_system   = string
    private_ip         = string
    kubelet_extra_args = optional(map(string))
    roles              = set(string)
    ssh = object({
      ip_address       = string
      port             = string
      private_key_path = string
      username         = string
    })
  }))
  default = {
    hostname1 = {
      arch             = "amd64"
      hostname         = "hostname1"
      operating_system = "Ubuntu22.04"
      private_ip       = "10.12.25.234"
      kubelet_extra_args = {
        max-pods                     = "300",
        cpu-manager-reconcile-period = "30s"
      }
      roles = ["ControlPlane", "Worker"]
      ssh = {
        ip_address       = "10.12.25.234"
        port             = "22"
        private_key_path = "/path/to/private/key"
        username         = "user"
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
