variables {
  aks_rbac_aad_admin_groups = {
    "my-aad-aks-admin-group" = "c0e0b0f0-0000-0000-0000-000000000000"
  }
  clusterissuer_email     = "example@appvia.io"
  dns_resource_group_name = "rg-wayfinder"
  dns_zone_name           = "wf.example.com"
  resource_group_name     = "rg-wayfinder"
  tags = {
    Repository  = "Your Repository URL"
    Provisioner = "Terraform"
  }
  wayfinder_instance_id = "yourwayfinderinstanc"
  wayfinder_licence_key = "wayfinder-licence-key"
}

run "quickstart" {
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
    condition = local.wayfinder_config.cert_manager_keyvault_cert_name == null
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.cert_manager_keyvault_name == null
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.clusterissuer == "letsencrypt-prod"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.clusterissuer_email == "example@appvia.io"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.create_localadmin_user == false
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.disable_internet_access == false
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.disable_local_login == false
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.dns_provider == "azure"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.dns_zone_id == "${data.azurerm_subscription.current.id}/resourceGroups/rg-wayfinder/providers/Microsoft.Network/dnszones/wf.example.com"
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
    condition = local.wayfinder_config.environment == "production"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.private_dns_zone_id == null
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.resource_group_name == "rg-wayfinder"
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.venafi_apikey == ""
    error_message = "wayfinder_config has changed"
  }
  assert {
    condition = local.wayfinder_config.venafi_zone == ""
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
        type          = "none"
        clientId      = null
        clientSecret  = null
        serverUrl     = ""
        azureTenantId = ""
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
    condition = azurerm_subnet.aks_nodes[0].address_prefixes == tolist(["10.0.1.0/24"])
    error_message = "address_prefixes has changed"
  }
  assert {
    condition = length(azurerm_subnet.aks_nodes[0].delegation) == 0
    error_message = "delegation has changed"
  }
  assert {
    condition = azurerm_subnet.aks_nodes[0].name == "aks-nodes"
    error_message = "name has changed"
  }
  assert {
    condition = azurerm_subnet.aks_nodes[0].resource_group_name == "rg-wayfinder"
    error_message = "resource_group_name has changed"
  }
  assert {
    condition = azurerm_subnet.aks_nodes[0].service_endpoint_policy_ids == null
    error_message = "service_endpoint_policy_ids has changed"
  }
  assert {
    condition = azurerm_subnet.aks_nodes[0].service_endpoints == null
    error_message = "service_endpoints has changed"
  }
  assert {
    condition = azurerm_subnet.aks_nodes[0].timeouts == null
    error_message = "timeouts has changed"
  }
  assert {
    condition = azurerm_subnet.aks_nodes[0].virtual_network_name == "wayfinder-production-vnet"
    error_message = "virtual_network_name has changed"
  }
  assert {
    condition = azurerm_user_assigned_identity.aks_identity[0].location == "uksouth"
    error_message = "location has changed"
  }
  assert {
    condition = azurerm_user_assigned_identity.aks_identity[0].name == "msi-wayfinder-production"
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
    condition = azurerm_virtual_network.wayfinder[0].address_space == tolist(["10.0.0.0/22"])
    error_message = "address_space has changed"
  }
  assert {
    condition = azurerm_virtual_network.wayfinder[0].bgp_community == null
    error_message = "bgp_community has changed"
  }
  assert {
    condition = length(azurerm_virtual_network.wayfinder[0].ddos_protection_plan) == 0
    error_message = "ddos_protection_plan has changed"
  }
  assert {
    condition = azurerm_virtual_network.wayfinder[0].edge_zone == null
    error_message = "edge_zone has changed"
  }
  assert {
    condition = length(azurerm_virtual_network.wayfinder[0].encryption) == 0
    error_message = "encryption has changed"
  }
  assert {
    condition = azurerm_virtual_network.wayfinder[0].flow_timeout_in_minutes == null
    error_message = "flow_timeout_in_minutes has changed"
  }
  assert {
    condition = azurerm_virtual_network.wayfinder[0].location == "uksouth"
    error_message = "location has changed"
  }
  assert {
    condition = azurerm_virtual_network.wayfinder[0].name == "wayfinder-production-vnet"
    error_message = "name has changed"
  }
  assert {
    condition = azurerm_virtual_network.wayfinder[0].resource_group_name == "rg-wayfinder"
    error_message = "resource_group_name has changed"
  }
  assert {
    condition = azurerm_virtual_network.wayfinder[0].tags == tomap({
      Provisioner = "Terraform"
      Repository = "Your Repository URL"
    })
    error_message = "tags has changed"
  }
  assert {
    condition = length(azurerm_role_assignment.private_dns) == 0
    error_message = "private dns role assignment should not be created when no private dns zone is provided"
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