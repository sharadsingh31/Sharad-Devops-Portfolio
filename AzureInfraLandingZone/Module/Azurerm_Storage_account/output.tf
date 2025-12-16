output "storage_account_name" {
    description = "The name of the Azure Storage Account."
    value = { for k, v in azurerm_storage_account.stg : k => v.name}
}

output "primary_blob_endpoint" {
    description = "The primary blob endpoint URL of the Storage Account"
    
value = { for k, v in azurerm_storage_account.stg : k => v.primary_blob_endpoint }
}

output "primary_access_key" {
    description = "The primary access key for the Storage Account."
    value = { for k, v in azurerm_storage_account.stg : k => v.primary_access_key}
    sensitive = true # Mark as sensitive to prevent display/expose in CLI output
}