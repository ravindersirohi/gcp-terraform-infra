
data "google_project" "default" { }

# resource "google_folder" "devops" {
#   display_name = "sirohi-devops-${terraform.workspace}"
#   parent = data.google_project.default.org_id
# }

resource "google_project" "current" {
    name          = var.project.name
    project_id    = var.project.id
    org_id = data.google_project.default.org_id
    #   folder_id     = google_folder.devops.name
}

resource "google_project_iam_member" "project_creator" { 
    project = google_project.current.project_id 
    role = "roles/owner" 
    member = data.google_client_openid_userinfo.me.email
}