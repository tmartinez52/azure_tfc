resource "azurerm_resource_group" "rg" {
    name = var.resource_group
    location = var.location


    tags = {
        Environment = "Azure Testing"
    }
}