resource "azurerm_recovery_services_vault" "vault" {
  name                = "Terraform-recovery-vault"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}