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


module "kubernetes-engine_example_node_pool" {
  source  = "terraform-google-modules/kubernetes-engine/google//examples/node_pool"
  version = "24.1.0"
  # insert the 8 required variables here
  compute_engine_service_account = "${data.google_project.equifax_sre_test.number}-compute@developer.gserviceaccount.com"
  ip_range_pods = "gke-pods-sec-range"
  ip_range_services = "gke-service-sec-range"
  network = data.google_compute_network.default_uscentral1.name
  project_id = var.project_name
  region = var.gcp_region
  subnetwork = google_compute_subnetwork.gke.name
  zones = ["${var.gcp_region}-a"]
}


