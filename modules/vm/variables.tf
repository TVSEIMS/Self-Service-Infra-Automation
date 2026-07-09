variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Azure VM size (e.g. Standard_D2s_v3)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group to deploy into"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "centralindia"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key for admin login"
  type        = string
}

variable "disk_size_gb" {
  description = "OS disk size in GB"
  type        = number
  default     = 128
}

variable "subnet_id" {
  description = "Subnet ID to attach the VM's NIC to"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources (e.g. ticket ID, environment)"
  type        = map(string)
  default     = {}
}
