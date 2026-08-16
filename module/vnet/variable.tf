variable "vnet" {
  type = map(object({
    vnet_name     = string
    rg_name       = string
    rg_location   = string
    address_space = list(string)
  }))

}