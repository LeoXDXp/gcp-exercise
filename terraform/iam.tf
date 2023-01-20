data "google_project" "equifax_sre_test" {}

resource "google_service_account" "packer" {
  account_id   = "packer-${var.packer_serv_acc_id}"
  display_name = "Packer Service Account"
}

resource "google_project_iam_binding" "packer" {
  for_each = toset(["roles/compute.instanceAdmin.v1", "roles/iam.serviceAccountUser", "roles/iam.serviceAccountTokenCreator"])
  project  = data.google_project.equifax_sre_test.number
  role     = each.key

  members = [
    "serviceAccount:${google_service_account.packer.email}",
  ]
}


resource "google_project_service" "packer_apis" {
  for_each = toset(["iam.googleapis.com"])
  project = data.google_project.equifax_sre_test.id
  service = "iam.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
