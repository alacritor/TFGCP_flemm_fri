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


resource "google_storage_bucket" "diggler-bucket2" {
  name          = "darth_diggler"
  location      = "us-west1"
  force_destroy = true

}


resource "google_compute_network" "diggler-auto-vpc-tf" {
  name = "diggler-auto-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "diggler-sub-sg" {
  name ="diggler-sub-sg"
  network = google_compute_network.auto-vpc-tf.id
  ip_cidr_range = "10.161.1.0/24"
  region = "southamerica-east1"
}


#resource "google_compute_network" "custom-vpc-tf" {
  #name = "custom-vpc-tf"
 #auto_create_subnetworks = false
#}

output "auto" {
  value = google_compute_network.auto-vpc-tf.id
}

#output "custom" {
#  value = google_compute_network.custom-vpc-tf.id
#}