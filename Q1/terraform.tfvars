prefix                              ="compname-ex01"
resource_group_name                 ="rg"
resource_location                   ="uksouth"
# Networking variable assignment starts here
VirtualNetwork                      ="vnet"
VirtualNetwork_AddressSpace         =["10.4.0.0/23"] # 512 addresses
# Add two subnet addressess for the vnet
Subnet_Addresses                    =[
                                        {
                                            ip      = "10.4.0.0/24"
                                            name     = "snet-1"
                                        },
                                        {
                                            ip      = "10.4.1.0/24"
                                            name     = "snet-2"
                                        }
                                    ]
App_Insights                        ="appi-1"
appservice_name                     ="app-1"
app_service_plan_name               ="plan"
azurerm_monitor_autoscale_setting   ="AppService1_AutoscaleSetting"
#PostGreSQL variable assignment starts here
Postgresql_Server                   ="psql"
Postgresql_DB                       ="northwind"
# Traffic Manager variable assignment starts here
TrafficManager_Profile              ="traf1"    
TrafficManager_Endpoint             ="traf-ep1"    
TrafficManager_Routing_Method       ="Weighted" # other values are Performance,Priority,Geographic
TrafficManager_Endpoint_Type        ="azureEndpoints"