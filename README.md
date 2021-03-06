<!-- BEGIN_TF_DOCS -->
# accounts

This module manages Azure AD Resources and Permissions.

<-- This file is autogenerated, please do not change. -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >=1.0 |
| azuread | >=2.22 |
| azurerm | >=3.6 |

## Providers

| Name | Version |
|------|---------|
| azuread | >=2.22 |
| azurerm | >=3.6 |

## Resources

| Name | Type |
|------|------|
| azuread_application.application | resource |
| azuread_application_password.application_password | resource |
| azuread_group.group | resource |
| azuread_group_member.group_member | resource |
| azuread_service_principal.service_principal | resource |
| azuread_service_principal_password.service_principal_password | resource |
| azuread_user.user | resource |
| azurerm_key_vault_secret.key_vault_secret | resource |
| azurerm_role_assignment.role_assignment | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| application_password | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| group | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| group_member | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| key_vault_secret | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| role_assignment | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| service_principal | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| service_principal_password | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| user | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| application | azuread_application results |
| application_password | azuread_application_password results |
| group | azuread_group results |
| key_vault_secret | azurerm_key_vault_secret results |
| service_principal | azuread_service_principal results |
| service_principal_password | azuread_service_principal_password results |
| user | azuread_user results |

## Examples

```hcl
module "accounts" {
  source = "registry.terraform.io/T-Systems-MMS/accounts/azure"
  application = {
    azuredevops = {
      display_name = "azuredevops"
      owners       = data.azuread_group.grp-admin.members
    }
  }
  service_principal = {
    azuredevops = {
      application_id = module.accounts.application.azuredevops.application_id
      description    = format("service-principal for %s", "azuredevops")
      owners         = data.azuread_group.grp-admin.members
    }
  }
  service_principal_password = {
    azuredevops = {
      service_principal_id = module.accounts.service_principal.azuredevops.object_id
      rotation             = time_rotating.rotating.service_principal.id
    }
  }
  key_vault_secret = {
    azuredevops = {
      name         = "azuredevops"
      key_vault_id = "service-mgmt-kv"
      value        = module.accounts.service_principal_password.azuredevops.value
      content_type = format("application %s", "azuredevops")
      tags = {
        service = "service_name"
      }
    }
  }
  role_assignment = {
    azuredevops = {
      scope                = data.azurerm_subscription.current.id
      role_definition_name = "Contributor"
      principal_id         = module.accounts.service_principal.azuredevops.object_id
    }
  }
}
```
<!-- END_TF_DOCS -->
