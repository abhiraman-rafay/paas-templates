variable "control_plane_nodes" {
  description = "Control Plane Node(s)"
  type        = map(any)
  default = {
    "hostname-1" = {
      "arch"             = "amd64"
      "hostname"         = "hostname-1"
      "private_ip"       = "10.1.0.67"
      "operating_system" = "Ubuntu22.04"
      "roles"            = ["ControlPlane", "Worker"]
      "ssh" = {
        "ip_address"       = "129.146.178.0"
        "port"            = "22"
        "private_key_path" = "private-key"
        "username"        = "ubuntu"
      }
    }
  }
}

variable "worker_nodes" {
  description = "Worker Node(s)"
  type        = map(any)
  default = {
    "worker-1" = {
      "arch"             = "amd64"
      "hostname"         = "worker-1"
      "private_ip"       = "10.1.0.68"
      "kubelet_extra_args" = {
        "max-pods"                      = "400"
        "cpu-manager-reconcile-period"  = "40s"
      }
      "operating_system" = "Ubuntu22.04"
      "roles"            = ["Worker"]
      "ssh" = {
        "ip_address"       = "129.146.178.1"
        "port"            = "22"
        "private_key_path" = "private-key"
        "username"        = "ubuntu"
      }
    }
  }
}

variable "private_key" {
  description = "Private key"
  type        = string
  default     = "..sssh"
}

output "control_plane_nodes" {
  value = var.control_plane_nodes
}

output "worker_nodes" {
  value = var.worker_nodes
}

output "private_key" {
  value     = var.private_key
  sensitive = true
}
