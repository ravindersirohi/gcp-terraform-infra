# gcp-terraform-infra
Google Cloud platform infrastructure setup via Terraform.

## What is covers ?
Please find below the list of resources been setup. 
- Setup Google provider
- Storage Bucket
- Compute instance.

## Terraform user permissions
Please freate a service account and grant listed below permission, and store the service account json in GCP_CREDENTIALS variable (GitHub ->repo -> settings)
- Folder Admin
- Project Editor
- Storage Admin

## Additional resources
- [Terraform provider for Google Cloud](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Service Account](https://cloud.google.com/iam/docs/service-accounts-create)

