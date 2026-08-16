variable "nic" {
  type = map(object({
    nic_name                      = string
    rg_name                       = string
    rg_location                   = string
    ip_configname_name            = string
    private_ip_address_allocation = string

    subnet_name = string
    vnet_name   = string
    pip_name    = string
  }))

}
