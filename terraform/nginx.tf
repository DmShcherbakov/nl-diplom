resource "yandex_compute_instance" "nginx" {
  name = "nginx"
  description = "Proxy server"
  hostname = "nginx"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = local.core_fr[terraform.workspace]
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu-image.id}"
      name        = "root-nginx"
      type        = "network-ssd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.first.id}"
    ip_address = "192.168.1.100"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("files/netology.pub")}"
  }

}

output "external_ip_address_nginx" {
  value = "${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"
}
