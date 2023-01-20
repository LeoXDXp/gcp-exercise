packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.0.0"
      source = "github.com/hashicorp/googlecompute"
    }
  }
}

variable "gcp_project_id" {
  type    = string
}

variable "gcp_zone" {
  type = string
}

variable "gcp_packer_sa" {
  type    = string
}

source "googlecompute" "bastion" {
  project_id = var.gcp_project_id
  source_image_family = "ubuntu-2004-lts"
  ssh_username = "packer"
  zone = var.gcp_zone
  image_description = "packer equifax sre exercise"
  image_name = "packer-bastion-20230120"
}

build {
  sources = ["sources.googlecompute.bastion"]
}
