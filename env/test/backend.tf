resource "null_resource" "upload_state" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = <<-EOT
      az storage blob upload --account-name="${module.storage_account_1.name}" --account-key="${module.storage_account_1.primary_access_key}" --container-name="${module.storage_account_1.containers_name}" --name="terraform.tfstate" --file="./terraform.tfstate"
    EOT
  }

  depends_on = [ module.storage_account_1 ]
}