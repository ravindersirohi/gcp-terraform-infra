resource "google_service_account" "sa" {
    account_id   = local.service_account_name
    display_name = "Service account for VM instance"
    project      = google_project.current.id
}

resource "google_compute_instance" "comp-ins" {
    name                      = local.compute_instance_name
    project                   = google_project.current.id
    machine_type              = "e2-medium"
    zone                      = var.region
    allow_stopping_for_update = true
    tags                      = local.tags

    boot_disk {
        initialize_params { 
            image = "debian-cloud/debian-10" 
        }
    }

    network_interface {
        network = "default"
    }

    metadata = { 
        startup-script = "sudo apt-get update && sudo apt-get install -y dotnet-sdk-8" 
    }

    service_account {
        email  = google_service_account.sa.email
        scopes = ["cloud-platform"]
    }
}