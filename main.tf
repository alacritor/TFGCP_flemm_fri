terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "flemming-friday-417400"
region = "us-central1"
zone = "us-central-a"
credentials = "flemming-friday-417400-cabce1bac815.json"
}

resource "google_storage_bucket" "tragic-mulot" {
  name          = "tragic-mulot"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}