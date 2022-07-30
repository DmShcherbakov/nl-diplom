resource "yandex_compute_instance" "gitlab" {
  name = "gitlab"
  description = "Gitlab-server"
  hostname = "gitlab"
  resources {
    cores         = 4
    memory        = local.memory[terraform.workspace]
    core_fraction = local.core_fr[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu-image.id}"
      name        = "root-gitlab"
      type        = "network-ssd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.first.id}"
    ip_address = "192.168.1.11"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("files/netology.pub")}"
  }

}
