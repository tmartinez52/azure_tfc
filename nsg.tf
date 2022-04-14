resource "azurerm_network_security_group" "nsg" {
    name = var.security_group
    location = var.location
    resource_group_name =  var.resource_group_name
    depends_on = [
      azurerm_resource_group.rg
    ]
}

resource "azurerm_network_security_rule" "rule_one" {
    name = "web80"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80" 
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = var.resource_group_name
    network_security_group_name = azurerm_network_security_group.nsg.name
}