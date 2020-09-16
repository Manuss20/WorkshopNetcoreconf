data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {
}

data "azuread_domains" "aad_domains" {
  only_default = true
}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create IoT Hub
# resource "azurerm_storage_account" "example" {
#   name                     = "examplestorage"
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_storage_container" "example" {
#   name                  = "examplecontainer"
#   storage_account_name  = azurerm_storage_account.example.name
#   container_access_type = "private"
# }

# resource "azurerm_eventhub_namespace" "example" {
#   name                = "example-namespace"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   sku                 = "Basic"
# }

# resource "azurerm_eventhub" "example" {
#   name                = "example-eventhub"
#   resource_group_name = azurerm_resource_group.rg.name
#   namespace_name      = azurerm_eventhub_namespace.rg.name
#   partition_count     = 2
#   message_retention   = 1
# }

# resource "azurerm_eventhub_authorization_rule" "example" {
#   resource_group_name = azurerm_resource_group.rg.name
#   namespace_name      = azurerm_eventhub_namespace.rg.name
#   eventhub_name       = azurerm_eventhub.example.name
#   name                = "acctest"
#   send                = true
# }

# resource "azurerm_iothub" "example" {
#   name                = "Example-IoTHub"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.example.location

#   sku {
#     name     = "S1"
#     capacity = "1"
#   }

#   endpoint {
#     type                       = "AzureIotHub.StorageContainer"
#     connection_string          = azurerm_storage_account.example.primary_blob_connection_string
#     name                       = "export"
#     batch_frequency_in_seconds = 60
#     max_chunk_size_in_bytes    = 10485760
#     container_name             = azurerm_storage_container.example.name
#     encoding                   = "Avro"
#     file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
#   }

#   endpoint {
#     type              = "AzureIotHub.EventHub"
#     connection_string = azurerm_eventhub_authorization_rule.example.primary_connection_string
#     name              = "export2"
#   }

#   route {
#     name           = "export"
#     source         = "DeviceMessages"
#     condition      = "true"
#     endpoint_names = ["export"]
#     enabled        = true
#   }

#   route {
#     name           = "export2"
#     source         = "DeviceMessages"
#     condition      = "true"
#     endpoint_names = ["export2"]
#     enabled        = true
#   }

#   tags = {
#     purpose = "testing"
#   }
# }