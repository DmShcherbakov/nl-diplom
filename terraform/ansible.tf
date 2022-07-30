resource "null_resource" "dns" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -e '{\"nginx_ext_ip\": ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} }' --vault-password-file '~/secrets/vault' -i ../ansible-dns/inventory.yml -u ubuntu ../ansible-dns/site.yml"
  }

  depends_on = [
    local_file.inventory
  ]
}

resource "null_resource" "sync" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/hosts.yml ../ansible/site.yml"
  }

  depends_on = [
    null_resource.dns
  ]
}

