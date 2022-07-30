resource "yandex_compute_instance" "runner" {
  name = "runner"
  description = "Gitlab-runner"
  hostname = "gitlab-runner"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = local.core_fr[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu-image.id}"
      name        = "root-gl-runner"
      type        = "network-ssd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.first.id}"
    ip_address = "192.168.1.17"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("files/netology.pub")}"
  }

}
