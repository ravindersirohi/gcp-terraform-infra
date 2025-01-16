
data "google_project" "default" { }

resource "google_folder" "devops" {
  display_name = "sirohi-devops-${terraform.workspace}"
  parent = data.google_project.default.org_id
}

resource "google_project" "current" {
  name          = var.project.name
  project_id    = var.project.id
  folder_id     = google_folder.devops.name
}