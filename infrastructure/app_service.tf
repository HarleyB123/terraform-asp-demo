resource "azurerm_resource_group" "demoresourcegroup" {
  name     = "demoappliveshere"
  location = "UK South"
}

resource "azurerm_app_service_plan" "demoasp" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.demoresourcegroup.location
  resource_group_name = azurerm_resource_group.demoresourcegroup.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "demoapp" {
  name                = var.name
  location            = azurerm_resource_group.demoresourcegroup.location
  resource_group_name = azurerm_resource_group.demoresourcegroup.name
  app_service_plan_id = azurerm_app_service_plan.demoasp.id
  # Below settings are optional - were required for the demo
  app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true" # needs to be true
    "FLASK_APP"                      = "view.py"
    "ORYX_APP_TYPE"                  = "webapps"
    "PLATFORM_NAME"                  = "python"
  }
  site_config {
    python_version   = "3.4"
    linux_fx_version = "PYTHON|3.8"
  }
}
