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
    condition = azurerm_user_assigned_identity.aks_identity[0].name == "msi-wayfinder-production"
    error_message = "The AKS cluster identity is not correct"
  }
}