variables {
  aks_rbac_aad_admin_groups = {
    "my-aad-aks-admin-group" = "c0e0b0f0-0000-0000-0000-000000000000"
  }
  clusterissuer_email     = "example@appvia.io"
  disable_local_login     = true
  dns_resource_group_name = "rg-wayfinder"
  dns_zone_name           = "wf.example.com"
  environment             = "prod"
  resource_group_name     = "rg-wayfinder"
  tags = {
    Repository  = "Your Repository URL"
    Provisioner = "Terraform"
  }
  wayfinder_idp_details = {
    type          = "aad"
    clientId      = "AZURE-AD-APPLICATION-ID"
    clientSecret  = "AZURE-AD-APPLICATION-CLIENT-SECRET-VALUE"
    azureTenantId = "AZURE-TENANT-ID"
    serverUrl     = ""
  }
  wayfinder_instance_id = "yourwayfinderinstanc"
  wayfinder_licence_key = "wayfinder-licence-key"
}

run "complete" {
  command = plan

  assert {
    condition = azurerm_user_assigned_identity.aks_identity[0].name == "msi-wayfinder-prod"
    error_message = "The AKS cluster identity is not correct"
  }
}