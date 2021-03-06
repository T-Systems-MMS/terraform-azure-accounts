output "key_vault_secret" {
  description = "azurerm_key_vault_secret results"
  value = {
    for key_vault_secret in keys(azurerm_key_vault_secret.key_vault_secret) :
    key_vault_secret => {
      name  = azurerm_key_vault_secret.key_vault_secret[key_vault_secret].name
      value = azurerm_key_vault_secret.key_vault_secret[key_vault_secret].value
    }
  }
}

output "user" {
  description = "azuread_user results"
  value = {
    for user in keys(azuread_user.user) :
    user => {
      id                  = azuread_user.user[user].id
      display_name        = azuread_user.user[user].display_name
      user_principal_name = azuread_user.user[user].user_principal_name
    }
  }
}

output "group" {
  description = "azuread_group results"
  value = {
    for group in keys(azuread_group.group) :
    group => {
      id           = azuread_group.group[group].id
      display_name = azuread_group.group[group].display_name
    }
  }
}

output "application" {
  description = "azuread_application results"
  value = {
    for application in keys(azuread_application.application) :
    application => {
      application_id = azuread_application.application[application].application_id
      object_id      = azuread_application.application[application].object_id
    }
  }
}

output "application_password" {
  description = "azuread_application_password results"
  value = {
    for application_password in keys(azuread_application_password.application_password) :
    application_password => {
      display_name = azuread_application_password.application_password[application_password].display_name
      key_id       = azuread_application_password.application_password[application_password].key_id
      value        = azuread_application_password.application_password[application_password].value
    }
  }
}

output "service_principal" {
  description = "azuread_service_principal results"
  value = {
    for service_principal in keys(azuread_service_principal.service_principal) :
    service_principal => {
      display_name = azuread_service_principal.service_principal[service_principal].display_name
      object_id    = azuread_service_principal.service_principal[service_principal].object_id
    }
  }
}

output "service_principal_password" {
  description = "azuread_service_principal_password results"
  value = {
    for service_principal_password in keys(azuread_service_principal_password.service_principal_password) :
    service_principal_password => {
      key_id       = azuread_service_principal_password.service_principal_password[service_principal_password].key_id
      display_name = azuread_service_principal_password.service_principal_password[service_principal_password].display_name
      end_date     = azuread_service_principal_password.service_principal_password[service_principal_password].end_date
      value        = azuread_service_principal_password.service_principal_password[service_principal_password].value
    }
  }
}
