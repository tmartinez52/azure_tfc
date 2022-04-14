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