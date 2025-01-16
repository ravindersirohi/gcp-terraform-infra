
data "google_project" "default" { }

resource "google_project" "current" {
  name       = var.project.name
  project_id = var.project.id
  folder_id  = google_folder.devops.id
}

resource "google_folder" "devops" {
  display_name = "sirohi-devops-${terraform.workspace}"
  parent = "organizations/${google_project.current.org_id}"
}
