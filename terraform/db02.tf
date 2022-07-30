resource "yandex_compute_instance" "mysql2" {
  name = "db02"
  description = "Mysql-server"
  hostname = "db02"
  resources {
    cores         = 4
    memory        = 4
    core_fraction = local.core_fr[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu-image.id}"
      name        = "root-db02"
      type        = "network-ssd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.first.id}"
    ip_address = "192.168.1.25"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("files/netology.pub")}"
  }

}
