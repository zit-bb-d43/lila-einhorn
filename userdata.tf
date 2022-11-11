data template_file "userdata" {
  template = file("lilaeinhorn.yml")

  vars = {
    hostname = var.hostname
    #hostname = "${hcloud_server.lilaeinhorn.name}"
    domain = var.domain
    dyndnsuser = var.dyndnsuser
    dyndnspass = var.dyndnspass
    dyndnsurl = var.dyndnsurl
    APIKEY_VIRUSTOTAL = var.APIKEY_VIRUSTOTAL
    APIKEY_VIEWDNS = var.APIKEY_VIEWDNS
    APIKEY_ALIENVAULT = var.APIKEY_ALIENVAULT
  }
}
