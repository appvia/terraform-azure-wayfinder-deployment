variables {
  aks_rbac_aad_admin_groups = {
    "my-aad-aks-admin-group" = "c0e0b0f0-0000-0000-0000-000000000000"
  }
  aks_vnet_subnet_id      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/XXXXXX/providers/Microsoft.Network/virtualNetworks/main/subnets/XXXXXXXX"
  clusterissuer           = "vaas-issuer"
  clusterissuer_email     = "my.email@example.com"
  location                = "uksouth"
  disable_internet_access = true
  disable_local_login     = true
  dns_provider            = "azure-private-dns"
  dns_resource_group_name = "rg-wayfinder"
  dns_zone_name           = "wf.example.com"
  environment             = "prod"
  private_dns_zone_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/alz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.uksouth.azmk8s.io"
  resource_group_name     = "rg-wayfinder"
  tags = {
    BusinessCriticality = "High"
    Environment         = "Production"
    Owner               = "SupportTeam"
    Project             = "Operations"
    Repository          = "Your Repository URL"
    Provisioner         = "Terraform"
  }
  venafi_apikey          = "00000000-0000-0000-0000-000000000000"
  venafi_zone            = "XXXX\\XXXX"
  wayfinder_idp_details  = {
    type          = "aad"
    clientId      = "AZURE-AD-APPLICATION-ID"
    clientSecret  = "AZURE-AD-APPLICATION-CLIENT-SECRET-VALUE"
    azureTenantId = "AZURE-TENANT-ID"
    serverUrl     = ""
  }
  wayfinder_instance_id = "yourwayfinderinstanc"
  wayfinder_licence_key = "wayfinder-licence-key"
}

run "private_with_venafi" {
  command = plan

  assert {
    condition = azurerm_user_assigned_identity.aks_identity[0].name == "msi-wayfinder-prod"
    error_message = "The AKS cluster identity is not correct"
  }
}