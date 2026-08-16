resource "azurerm_virtual_network" "Myvnet" {
  for_each            = var.vnet
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location
  address_space       = each.value.address_space

}