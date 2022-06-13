variable "prefix" {
    description     = "Sets the default prefix for all the azure resource being created"
    type            = string
}



variable "resource_group_name" {
  description       = "Name of the Resource Group"
  type              = string
}

variable "resource_location" {
  description       = "Default location for all the resources"
  type              = string
}

# Networking variable declaration starts here
variable "VirtualNetwork" {
  description       = "Virtaul network name for all the resources"
  type              = string
}
variable "VirtualNetwork_AddressSpace" {
  description       = "Virtaul network Address space for all the resources"
}

variable "Subnet_Addresses" {
  description       = "Subnet address and name for all the resources as a list"
  type              = list
}


variable "App_Insights" {
  description       = "Name of the app insights"
  type              = string
}

variable "appservice_name" {
  description       = "Name of the app service name"
  type              = string
}

variable "app_service_plan_name" {
    description       = "Name of the app service plan"
    type              = string
  
}

variable "azurerm_monitor_autoscale_setting" {
    description       = "Name of the autoscale settings"
    type              = string
}

# PostGreSQL DB variable declaration starts here
variable "Postgresql_Server" {
    description       = "Name of the PostgreSql Server"
    type              = string
}
variable "Postgresql_DB" {
    description       = "Name of the Postgresql Database"
    type              = string
}

#Traffic Manager variable declaration starts here
variable "TrafficManager_Profile" {
    description       = "Name of the Traffic Manger Profile"
    type              = string
}
variable "TrafficManager_Routing_Method" {
    description       = "Name of the Traffic Manger Routing Method"
    type              = string
}
variable "TrafficManager_Endpoint" {
    description       = "Name of the Traffic Manger Endpoint"
    type              = string
}
variable "TrafficManager_Endpoint_Type" {
    description       = "Type of the Traffic Manger Endpoint"
    type              = string
}