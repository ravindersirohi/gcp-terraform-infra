locals {
    tags = [
        var.project.id,
        terraform.workspace
    ]

    compute_instance_name = "ci-${var.project.id}-ew-${terraform.workspace}"
    service_account_name = "sa-ci-${var.project.id}-${terraform.workspace}"
    storage_bucket_name = "sb-${var.project.id}-ew-${terraform.workspace}"

}