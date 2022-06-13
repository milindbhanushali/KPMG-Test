resource "random_id" "server" {
  keepers = {
    azi_id = 1
  }

  byte_length = 8
}


# Create the Traffice Manager profile
resource "azurerm_traffic_manager_profile" "traffic_manager" {
    name                    = "${var.prefix}-${var.TrafficManager_Profile}"
    resource_group_name     = azurerm_resource_group.resource_group.name
    traffic_routing_method  = var.TrafficManager_Routing_Method

# Setup the cname record in the DNS server so that DNS record is mapped to the Trafficmanger url
    dns_config {
                        relative_name = random_id.server.hex
                        ttl           = 100
                }
    monitor_config {
                        protocol                     = "http"
                        port                         = 80
                        path                         = "/"
                        interval_in_seconds          = 30
                        timeout_in_seconds           = 9
                        tolerated_number_of_failures = 3
                    }
  
}



# Create the Traffic Manager Endpoint

resource "azurerm_traffic_manager_endpoint" "traffic_manager_endpoint" {
    name                    = "${var.prefix}-${var.TrafficManager_Endpoint}"
    resource_group_name     = azurerm_resource_group.resource_group.name
    profile_name            = azurerm_traffic_manager_profile.traffic_manager.name
    type                    = var.TrafficManager_Endpoint_Type
    target_resource_id      = azurerm_app_service.appservice.id
    weight                  ="1"
  
}