resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = "Azure Testing"
  }
}