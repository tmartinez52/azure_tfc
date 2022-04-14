resource "azurerm_mysql_server" "db" {
    name = "azuremysqltf30052"
    location = var.location
    resource_group_name = var.resource_group_name

    sku_name = "B_Gen5_2"
    storage_mb = 5120
    backup_retention_days = 7
    administrator_login = var.username
    administrator_login_password = var.password
    version = "5.7"
    ssl_enforcement_enabled = true
    geo_redundant_backup_enabled = false
    depends_on = [
      azurerm_resource_group.rg
    ]
}

resource "azurerm_mysql_database" "example" {
    name = "exampledb"
    resource_group_name = var.resource_group_name
    server_name = azurerm_mysql_server.db.name
    charset = "utf8"
    collation = "utf8_unicode_ci"
}