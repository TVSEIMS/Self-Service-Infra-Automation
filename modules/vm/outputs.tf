output "vm_id" {
  description = "The resource ID of the created VM"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_private_ip" {
  description = "The private IP address assigned to the VM"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "vm_name" {
  description = "The name of the created VM"
  value       = azurerm_linux_virtual_machine.vm.name
}
