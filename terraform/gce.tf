/*
resource "google_compute_instance_from_machine_image" "gke_bastion" {
  provider = google-beta
  name     = "gke-bastion"
  zone     = "${var.gcp_region}-a"

  source_machine_image = "projects/${data.google_project.equifax_sre_test.number}/global/machineImages/packer-bastion-20230120"
}
*/
