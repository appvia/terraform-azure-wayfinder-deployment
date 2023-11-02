provider "azurerm" {
  use_msi = true
  subscription_id = "c37a3080-9ea8-4fc6-8b55-cf949c497a58"
  tenant_id = "7a770e35-b455-4df2-a276-b07408438d9a"
  client_id = "f3072f15-353e-4642-b4a8-fff3433b0be5"
  features {}
}

provider "azapi" {
  use_msi = true
  subscription_id = "c37a3080-9ea8-4fc6-8b55-cf949c497a58"
  tenant_id = "7a770e35-b455-4df2-a276-b07408438d9a"
  client_id = "f3072f15-353e-4642-b4a8-fff3433b0be5"
}

provider "helm" {
  kubernetes {
    client_certificate     = base64decode(module.wayfinder.aks_client_certificate)
    client_key             = base64decode(module.wayfinder.aks_client_key)
    cluster_ca_certificate = base64decode(module.wayfinder.aks_cluster_ca_certificate)
    host                   = module.wayfinder.aks_admin_host
  }
}

provider "kubectl" {
  client_certificate     = base64decode(module.wayfinder.aks_client_certificate)
  client_key             = base64decode(module.wayfinder.aks_client_key)
  cluster_ca_certificate = base64decode(module.wayfinder.aks_cluster_ca_certificate)
  host                   = module.wayfinder.aks_admin_host
  load_config_file       = false
}

provider "kubernetes" {
  client_certificate     = base64decode(module.wayfinder.aks_client_certificate)
  client_key             = base64decode(module.wayfinder.aks_client_key)
  cluster_ca_certificate = base64decode(module.wayfinder.aks_cluster_ca_certificate)
  host                   = module.wayfinder.aks_admin_host
}
