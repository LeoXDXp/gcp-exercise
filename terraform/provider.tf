terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.44.1"
    }
  }
  backend "local" {
   path = "terraform.tfstate"
 }
}

provider "google" {
  project     = var.project_name
  region      = var.gcp_region
}

provider "google-beta" {
  project     = var.project_name
  region      = var.gcp_region
}
