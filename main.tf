
provider "azurerm" {
  version  = "1.39"
}

resource "azurerm_resource_group" "rg" {
  name      =       var.rgname
  location  =       var.location
}

