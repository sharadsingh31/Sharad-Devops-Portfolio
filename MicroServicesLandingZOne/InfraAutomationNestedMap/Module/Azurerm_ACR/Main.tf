resource "azurerm_container_registry" "acr" {
  name                = "containerRegistry1"
  resource_group_name = "shrg1"
  location            = "east us"
  sku                 = "Premium"

}
  