# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

data "hcloud_ssh_key" "ssh_key" {
  fingerprint = var.ssh_key_fingerprint
}

resource "hcloud_server" "lilaeinhorn" {
  # count = var.instances
  name = "${var.hostname}" # -${count.index}"
  image = var.image 
  server_type = var.server_type
  location = var.location
  ssh_keys = [data.hcloud_ssh_key.ssh_key.id]
  user_data = data.template_file.userdata.rendered
}

