resource "random_id" "default" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name                        = "${random_id.default.hex}-gcf-source"
  location                    = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access {
    enabled = true
  }

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
