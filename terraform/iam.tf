data "google_project" "equifax_sre_test" {}
/*
resource "google_service_account" "gke" {
  account_id   = "gke-${var.packer_serv_acc_id}"
  display_name = "GKE Service Account"
}

# note this requires the terraform to be run regularly
resource "time_rotating" "gke_sa_key" {
  rotation_days = 30
}

resource "google_service_account_key" "gke" {
  service_account_id = google_service_account.gke.name

  keepers = {
    rotation_time = time_rotating.packer_sa_key.rotation_rfc3339
  }
}

resource "google_project_iam_binding" "gke" {
  for_each = toset(["", "", "", ""])
  project  = data.google_project.equifax_sre_test.number
  role     = each.key

  members = [
    "serviceAccount:${google_service_account.packer.email}",
  ]
}
*/
resource "google_project_service" "packer_apis" {
  for_each = toset(["iam.googleapis.com", "compute.googleapis.com", "container.googleapis.com", "dns.googleapis.com"])
  project = data.google_project.equifax_sre_test.id
  service = each.key

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
