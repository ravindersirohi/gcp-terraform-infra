
resource "google_storage_bucket" "default" {
  name                        = "gsb-pocapps-cloud-func-ew"
  location                    = "europe-west2"
  force_destroy               = true
  uniform_bucket_level_access = true
  
  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  cors {
    origin = ["http://example.com"]
    method = ["GET", "HEAD"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}
