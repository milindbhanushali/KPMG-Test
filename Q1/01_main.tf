provider "azurerm" {
  version = "=2.0.0"
  features {}
}



# Create the resoure group for the resources
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.prefix}-${var.resource_group_name}"
  location = var.resource_location

}


# Creates the virtual network for the resources
resource "azurerm_virtual_network" "vnet1" {

  name                    = "${var.prefix}-${var.VirtualNetwork}"
  location                = azurerm_resource_group.resource_group.location
  resource_group_name     = azurerm_resource_group.resource_group.name
  address_space           =var.VirtualNetwork_AddressSpace
}


# Create the default subnet for the vnet
resource "azurerm_subnet" "subnet-default" {

  name                    = lookup(element(var.Subnet_Addresses, count.index), "name")
  count                   = length(var.Subnet_Addresses)
  resource_group_name     = azurerm_resource_group.resource_group.name
  virtual_network_name    = azurerm_virtual_network.vnet1.name
  address_prefix          = lookup(element(var.Subnet_Addresses, count.index), "ip")
}