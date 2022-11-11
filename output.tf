output "hostname" {
  value = "${hcloud_server.lilaeinhorn.name}"
}
output "status" {
  value = "${hcloud_server.lilaeinhorn.status}"
}

output "ipv4" {
  value = "${hcloud_server.lilaeinhorn.ipv4_address}"
}
