variable "nodes" {
  description = "Control Plane Node(s)"
  type        = list(object({
    arch             = string
    hostname         = string
    operatingSystem  = string
    privateip        = string
    kubelet_args     = optional(map(string),{})
    roles            = list(string)
    ssh = object({
      ipAddress       = string
      port            = optional(string, "22")
      privateKeyPath  = string
      username        = string
    })
  }))
  
  default = [
    {
      arch            = "amd64"
      hostname        = "ip-172-31-61-40"
      operatingSystem = "Ubuntu20.04"
      privateip       = "172.31.61.40"
      kubelet_args = {
        "max-pods" = "6"
        "<key>"    = "<value>"
      }
      roles = ["Master", "Worker", "Storage"]
      ssh = {
        ipAddress      = "35.86.208.181"
        port           = "22"
        privateKeyPath = "mks-test.pem"
        username       = "ubuntu"
      }
    }
  ]
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
