
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
  

provider "azurerm" { 

  features {} 

}




