resource "azurerm_virtual_machine" "example" {
    name = var.vmname
    location = var.location 
    resource_group_name = var.resource_group_name
    network_interface_ids =  [azurerm_network_interface.example.id]
    vm_size = "Standard_DC2s_v2"
    delete_os_disk_on_termination = true
    delete_data_disks_on_termination = true
    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-lts-gen2"
        version = "latest"
    }
    storage_os_disk {
        name = "osdisk1"
        disk_size_gb = "128"
        caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "Standard_LRS"
    }
    os_profile {
        computer_name = "forge"
        admin_username = var.username
        admin_password = var.password
    }
    os_profile_linux_config {
        disable_password_authentication = false
    }
    boot_diagnostics {
        enabled = "true"
        storage_uri = azurerm_storage_account.sa.primary_blob_endpoint
    }
}