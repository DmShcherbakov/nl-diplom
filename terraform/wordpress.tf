resource "yandex_compute_instance" "wordpress" {
  name = "app"
  description = "Web-server"
  hostname = "app"
  resources {
    cores         = 4
    memory        = 4
    core_fraction = local.core_fr[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu-image.id}"
      name        = "root-wordpress"
      type        = "network-ssd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.first.id}"
    ip_address = "192.168.1.10"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("files/netology.pub")}"
  }

}
