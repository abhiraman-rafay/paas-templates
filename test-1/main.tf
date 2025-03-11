variable "nodes" {
  description = "Node details as an object with a list of nodes"
  type = object({
    nodes = list(object({
      arch            = optional(string, "amd64")
      hostname        = string
      operatingSystem = optional(string, "Ubuntu22.04")
      privateip       = string
      kubelet_args    = optional(map(string), {})
      roles           = optional(list(string), [])
      ssh = object({
        ipAddress      = string
        port           = optional(string, "22")
        privateKeyPath = string
        username       = string
      })
    }))
  })

  default = {
    nodes = [
      {
        arch            = "amd64"
        hostname        = "default-host"
        operatingSystem = "Ubuntu22.04"
        privateip       = "192.168.1.100"
        kubelet_args    = { "max-pods" = "10" }
        roles           = ["Worker"]
        ssh = {
          ipAddress      = "203.0.113.10"
          port           = "22"
          privateKeyPath = "default-key.pem"
          username       = "ubuntu"
        }
      }
    ]
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
