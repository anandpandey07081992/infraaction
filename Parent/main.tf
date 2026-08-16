module "resource_group" {
  source = "../module/resource_group"
  rg     = var.rg

}




module "vnet" {
  depends_on = [module.resource_group]
  source     = "../module/vnet"

  vnet = var.vnet
}




module "subnet" {
  depends_on = [module.vnet]
  source     = "../module/subnet"
  subnet     = var.subnet

}




module "Public_ip" {
  depends_on = [module.resource_group]
  source     = "../module/Public_ip"
  pip        = var.pip

}

module "nic" {
  depends_on = [module.subnet, module.Public_ip]

  source = "../module/nic"
  nic    = var.nic


}


module "vms" {
  depends_on = [module.nic, module.Public_ip]
  source     = "../module/virtual_machine"
  vms        = var.vms

}
