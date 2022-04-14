resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = "Azure Testing"
  }
  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "azurerm_storage_container" "sa_container" {
    name = var.sa_container
    storage_account_name = azurerm_storage_account.sa.name
    container_access_type = "private"
}

resource "azurerm_storage_blob" "sa_blob" {
    name = var.sa_blob
    storage_account_name =  azurerm_storage_account.sa.name
    storage_container_name = azurerm_storage_container.sa_container.name
    type = "Block"
}
resource "azurerm_storage_share" "sa_share" {
    name = var.sa_share
    storage_account_name = azurerm_storage_account.sa.name
    quota = 50
}