

provider "azurerm" {
  version  = "1.44"
  client_id = var.client_id
  client_secret = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name      =       var.rgname
  location  =       var.rglocation
}

