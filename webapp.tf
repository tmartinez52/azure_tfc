resource "azurerm_app_service_plan" "svcplan" {
    name = "newweb-appserviceplan"
    location = var.location
    resource_group_name = var.resource_group_name

    sku {
        tier = "Standard"
        size = "S2"
    }
    depends_on = [
      azurerm_resource_group.rg
    ]
}

resource "azurerm_app_service" "appsvc" {
    name = "custom-tf-webapp"
    location = var.location
    resource_group_name = var.resource_group_name
    app_service_plan_id = azurerm_app_service_plan.svcplan.id

    site_config {
      dotnet_framework_version = "v4.0"
      scm_type = "LocalGit"
    }

}