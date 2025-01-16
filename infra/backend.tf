
terraform {
  backend "gcs" { 
    bucket = "pocapps-terraform-state" 
    prefix = "terraform/state/gpc-terraform-infra"
  }
}