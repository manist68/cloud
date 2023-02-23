
terraform { 

  required_providers { 

    azurerm = { 

      source  = "hashicorp/azurerm" 

      version = "=2.46.0" 

    } 

  } 

    backend "azurerm" { 

        resource_group_name  = "nt-poc-akshaya" 

        storage_account_name = "sinkstrgadf" 

        container_name       = "terra" 

        key                  = "rg/terraform.tfstate" 

    } 
    
    }

  
resource "azurerm_resource_group" "rgmani" { 

  name     = "maniislearning" 

  location = "Central India" 

} 
  

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id       = "be30711a-0ec0-4690-99cc-92dc41957c74"
  client_secret   = "5539c3c7-7a20-4e0d-91b6-3c3a2cbb21cd"
  tenant_id       = "00bb5983-b28f-4542-a099-20eaf8bbb209"
  subscription_id = "79f5beb2-913f-497f-b2bf-26792a7c08e4"
}
