resource "azurerm_mysql_server" "db" {
    name = "mysql-tf"
    location = var.location
    resource_group_name = var.resource_group_name


    sku {
        name = "B_Gen5_2"
        capacity = 2
        tier = "Basic"
        family = "Gen5"
    }

    storage_profile {
        storage_mb = 5120
        backup_retention_days = 7
        geo_redundant_backup = "Disabled"
    }
    administrator_login = var.username
    administrator_login_password = var.password
    version = "5.7"
    ssl_enforcement = "Enabled"
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