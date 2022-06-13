resource "azurerm_postgresql_server" "postgressql_server" {

    name                    = "${var.prefix}-${var.Postgresql_Server}"
    location                = azurerm_resource_group.resource_group.location
    resource_group_name     = azurerm_resource_group.resource_group.name
   
    sku_name = "B_Gen5_2"
    
    storage_profile {
       storage_mb                   = 5120
       backup_retention_days        = 7
       geo_redundant_backup         = "Disabled"
       
    }

   # Move this to azure vault
    administrator_login          = "psqladminun"
    administrator_login_password = "H@Sh1CoR3!"
    version                      = "11"
    
    ssl_enforcement = "Enabled"
   

  
}

resource "azurerm_postgresql_database" "postgressql_db" {
   name                = var.Postgresql_DB
   resource_group_name = azurerm_resource_group.resource_group.name
   server_name         = azurerm_postgresql_server.postgressql_server.name
   charset             = "UTF8"
   collation          = "English_United States.1252"

}