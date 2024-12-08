terraform {
  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = "1.4.2"
    }
  }
}

provider "multipass" {}

resource "multipass_instance" "laravel-todo" {
  name   = var.instance_name
  memory = var.memory
  cpus   = var.cpus
  image  = var.image_name
  disk   = var.disk_size
}
