resource "yandex_compute_image" "ubuntu-image" {
  name       = "my-ubuntu-image"
  source_image = "fd826dalmbcl81eo5nig"
}
