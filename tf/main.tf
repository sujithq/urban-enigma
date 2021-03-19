terraform {
  backend "azurerm" {
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project}-${var.env}"
  location = var.location
}

resource "azurerm_app_service_plan" "plan" {
  name                = "plan-${var.project}-${var.env}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  # kind                = "Linux"
  # reserved            = true
  sku {
    tier = var.plan.tier
    size = var.plan.size
  }
}

resource "azurerm_app_service" "app" {
  name                = "app-${var.project}-${var.env}"
  resource_group_name = azurerm_app_service_plan.plan.resource_group_name
  location            = azurerm_app_service_plan.plan.location
  app_service_plan_id = azurerm_app_service_plan.plan.id
  app_settings = {
    "env" = var.env
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE" = "true"
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}