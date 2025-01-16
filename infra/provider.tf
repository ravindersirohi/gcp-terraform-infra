terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.16.0"
    }
  }
}

provider "google" {
  project = "pocapps" 
  region = var.region
}

data "google_client_config" "current" {}

output "client_config_details" { 
    value = data.google_client_config.current
}

data "google_client_openid_userinfo" "me" {}

output "google_client_openid_userinfo" { 
    value = data.google_client_openid_userinfo.me
}