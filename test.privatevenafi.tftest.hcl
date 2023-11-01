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
    condition = local.wayfinder_config.aks_api_server_authorized_ip_ranges == tolist([
        "0.0.0.0/0",
      ])
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.aks_rbac_aad_admin_group_object_ids == tolist([
        "c0e0b0f0-0000-0000-0000-000000000000",
      ])
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.aks_vnet_subnet_id == "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/XXXXXX/providers/Microsoft.Network/virtualNetworks/main/subnets/XXXXXXXX"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.cert_manager_keyvault_cert_name == null
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.cert_manager_keyvault_name == null
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.clusterissuer == "vaas-issuer"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.clusterissuer_email == "my.email@example.com"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.create_localadmin_user == false
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.disable_internet_access == true
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.disable_local_login == true
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.dns_provider == "azure-private-dns"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.dns_zone_id == "${data.azurerm_subscription.current.id}/resourceGroups/rg-wayfinder/providers/Microsoft.Network/privateDnsZones/wf.example.com"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.dns_zone_name == "wf.example.com"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.enable_k8s_resources == true
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.environment == "prod"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.private_dns_zone_id == "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/alz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.uksouth.azmk8s.io"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.resource_group_name == "rg-wayfinder"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.venafi_apikey == "00000000-0000-0000-0000-000000000000"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.venafi_zone == "XXXX\\XXXX"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.wayfinder_domain_name_api == "api.wf.example.com"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.wayfinder_domain_name_ui == "portal.wf.example.com"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = tomap(local.wayfinder_config.wayfinder_idp_details) == tomap({
        type          = "aad"
        clientId      = "AZURE-AD-APPLICATION-ID"
        clientSecret  = "AZURE-AD-APPLICATION-CLIENT-SECRET-VALUE"
        azureTenantId = "AZURE-TENANT-ID"
        serverUrl     = ""
      })
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.wayfinder_instance_id == "yourwayfinderinstanc"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.wayfinder_licence_key == "wayfinder-licence-key"
    error_message = "wayfinder_config has changed"
  }

  assert {
    condition = length(azurerm_subnet.aks_nodes) == 0
    error_message = "subnet should not be created when subnet id is provided"
  }
  assert {
    condition = azurerm_user_assigned_identity.aks_identity[0].location == "uksouth"
    error_message = "location has changed"
  }
  assert {
    condition = azurerm_user_assigned_identity.aks_identity[0].name == "msi-wayfinder-prod"
    error_message = "name has changed"
  }
  assert {
    condition = azurerm_user_assigned_identity.aks_identity[0].resource_group_name == "rg-wayfinder"
    error_message = "resource_group_name has changed"
  }
  assert {
    condition = azurerm_user_assigned_identity.aks_identity[0].tags == null
    error_message = "tags has changed"
  }
  assert {
    condition = azurerm_user_assigned_identity.aks_identity[0].timeouts == null
    error_message = "timeouts has changed"
  }
  assert {
    condition = length(azurerm_virtual_network.wayfinder) == 0
    error_message = "virtual network should not be created when subnet id is provided"
  }
  assert {
    condition = azurerm_role_assignment.private_dns[0].scope == "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/alz-dns/providers/Microsoft.Network/privateDnsZones/privatelink.uksouth.azmk8s.io"
    error_message = "private dns role assignment scope has changed"
  }
  assert {
    condition = azurerm_role_assignment.private_dns[0].role_definition_name == "Private DNS Zone Contributor"
    error_message = "private dns role assignment role name has changed"
  }
  assert {
    condition = length(random_id.kv) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(azurerm_key_vault.kv) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(azurerm_role_assignment.kv) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(azurerm_private_endpoint.kv) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(tls_private_key.root) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(tls_self_signed_cert.root) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(azurerm_key_vault_certificate.root) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(tls_private_key.signing) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(tls_cert_request.signing) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(tls_locally_signed_cert.signing) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
  assert {
    condition = length(azurerm_key_vault_certificate.signing) == 0
    error_message = "key vault should not be created if not using keyvault cluster issuer"
  }
}