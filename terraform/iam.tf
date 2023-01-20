data "google_project" "equifax_sre_test" {}

resource "google_service_account" "packer" {
  account_id   = var.packer_serv_acc_id
  display_name = "Packer Service Account"
}

resource "google_project_iam_binding" "packer" {
  for_each = toset(["roles/compute.instanceAdmin.v1", "roles/iam.serviceAccountUser", "roles/iap.tunnelResourceAccessor"])
  project  = data.google_project.equifax_sre_test.number
  role     = each.key

  members = [
    "serviceAccount:${google_service_account.packer.email}",
  ]
}
