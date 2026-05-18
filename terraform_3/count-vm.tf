locals {
  ssh_keys = join("\n", [
    "ubuntu:${file("~/.ssh/id_ed25519.pub")}",
    "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILxZmFXNODowkJnlu55cuZpwjSYc6X7mx9huGC3LrKoE vps-bot"
  ])
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}

resource "yandex_compute_instance" "web" {
  count       = var.vm_web_count
  name        = "${var.vm_web_name}-${count.index + 1}"
  platform_id = var.vm_web_platform_id
  
  resources {
    cores         = var.vm_web_resources.cores
    memory        = var.vm_web_resources.memory
    core_fraction = var.vm_web_resources.core_fraction
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  
  scheduling_policy {
    preemptible = true
  }
  
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  
  metadata = {
    serial-port-enable = 1
    ssh-keys           = local.ssh_keys
  }
  
  depends_on = [yandex_compute_instance.db]
}
