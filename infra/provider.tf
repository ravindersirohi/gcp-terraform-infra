terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.16.0"
    }
  }
  backend "gcs" { 
    bucket = "pocapps-terraform-state" 
    prefix = "terraform/state/gpc-terraform-infra/${terraform.workspace}"
  }
}

provider "google" {
  project = "pocapps" 
  region = "europe-west2"
}
