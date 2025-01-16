resource "google_service_account" "sa" {
    account_id   = local.service_account_name
    display_name = "Service account for VM instance"
}

resource "google_compute_instance" "comp-ins" {
    name                        = local.compute_instance_name
    machine_type                = "e2-medium"
    zone                        = "europe-west2-b"
    allow_stopping_for_update   = true
    tags                        = local.tags

    boot_disk {
        initialize_params { 
            image = "debian-cloud/debian-12" 
        }
    }

    network_interface {
        network = "default"
    }

    metadata_startup_script = <<-EOF 
        #!/bin/bash 
        apt-get update 
        apt-get install -y dotnet-sdk-8 
        mkdir /app 
        cd /app 
        dotnet new web -o my-dotnet-app 
        cd my-dotnet-app 
        dotnet run 
    EOF

    service_account {
        email  = google_service_account.sa.email
        scopes = ["cloud-platform"]
    }
}