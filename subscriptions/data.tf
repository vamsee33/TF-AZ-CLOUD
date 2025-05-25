# For a Microsoft Customer Account(Agreement)
# data "azurerm_billing_mca_account_scope" "mca" {
#   billing_account_name = "e879cf0f-2b4d-5431-109a-f72fc9868693:024cabf4-7321-4cf9-be59-df0c77ca51de_2019-05-31"
#   billing_profile_name = "PE2Q-NOIT-BG7-TGB"
#   invoice_section_name = "MTT4-OBS7-PJA-TGB"
# }

# For Enrollment account
data "azurerm_billing_enrollment_account_scope" "example" {
  billing_account_name    = "1234567890"
  enrollment_account_name = "0123456"
}

data "azurerm_management_group" "mg" {
  display_name = "#Name##"
}
