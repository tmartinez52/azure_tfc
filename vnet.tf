resource "azurerm_virtual_network" "vnet" {
    name = var.vnet
    address_space = [var.address_space]
    location = var.location
    resource_group_name = var.resource_group_name

    depends_on = [
      azurerm_resource_group.rg
    ]
}
resource "azurerm_subnet" "subnet" {
    name = var.subnet
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = [var.prefix]
}

resource "azurerm_network_watcher" "vnet_watcher" {
  name                = var.watcher
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on = [
    azurerm_resource_group.rg
  ]
}
resource "azurerm_public_ip" "example" {
    name = "pubip1"
    location = var.location
    resource_group_name = var.resource_group_name
    allocation_method = "Dynamic"
    sku = "Basic"
    depends_on = [
      azurerm_resource_group.rg
    ]
}
resource "azurerm_network_interface" "example" {
    name = "forge-nic"
    location = var.location
    resource_group_name = var.resource_group_name
    ip_configuration {
      name = "ipconfig1"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"  
      public_ip_address_id = azurerm_public_ip.example.id
    }
}