resource "yandex_compute_disk" "storage_disk" {
  count = var.storage_disk_count
  name  = "storage-disk-${count.index + 1}"
  type  = "network-hdd"
  zone  = var.default_zone
  size  = var.storage_disk_size
}

resource "yandex_compute_instance" "storage" {
  name        = var.vm_storage_name
  platform_id = var.vm_storage_platform_id
  
  resources {
    cores         = var.vm_storage_resources.cores
    memory        = var.vm_storage_resources.memory
    core_fraction = var.vm_storage_resources.core_fraction
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      disk_id = secondary_disk.value.id
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
}
