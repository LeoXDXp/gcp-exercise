variable "gcp_region" {
  type = string
  default = "us-central1"
}

variable "project_name" {
  type = string
  default = "equifax-sre-test"
}

variable "packer_serv_acc_id" {
  type = string
  description = "Used to create the service account unique id"
  default = "a123456732343245343"
}
