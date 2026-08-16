# resource "azurerm_network_interface" "mynic" {

#     for_each = var.nic
#     name = each.value.nic_name
#     resource_group_name = each.value.rg_name
#     location = each.value.rg_location
#     ip_configuration {

#        name = "myipconfiguration"
#     #    subnet_id = azurerm_subnet.subnet.id
#        private_ip_address_allocation = "Dynamic"
#     #    public_ip_address_id = azurerm_public_ip.pip.id

#     subnet_id = each.value.subnet_id
#     public_ip_address_id = each.value.public_ip_id
#     }

# }



resource "azurerm_network_interface" "mynic" {

  for_each = var.nic

  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location

  ip_configuration {

    name                          = each.value.ip_configname_name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
}