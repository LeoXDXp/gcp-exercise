data "google_compute_network" "default_uscentral1" {
  name = "default"
}

resource "google_compute_subnetwork" "gke" {
  name   = "gke-${var.gcp_region}"
  region = var.gcp_region

  ip_cidr_range = "10.0.0.0/20"
  network       = data.google_compute_network.default_uscentral1.name
  secondary_ip_range {
    range_name    = "gke-pods-sec-range"
    ip_cidr_range = "10.0.16.0/20"
  }
  secondary_ip_range {
    range_name    = "gke-service-sec-range"
    ip_cidr_range = "10.0.32.0/20"
  }
}
