variable "location" {
  default = "nbg1"
}
variable "instances" {
  default = "1"
}
variable "server_type" {
  default = "cx11"
}
variable "image" {
  default = "fedora-39"
}
variable "ssh_key_fingerprint" {
  default = ""
}
variable "hostname" {
  default = "myhost"
}
variable "domain" {
  default=""
}

variable "usersshkeys" {
  type = list(string)
  default = []
}

# dyndns
variable "dyndnsuser" {
  default = "dyndnsuser"
}
variable "dyndnspass" {
  default = "dyndnspass"
}
variable "dyndnsurl" {
  default = "https://dyndnsurl/foo/bar"
}
# ApiKeys, env vars
variable "APIKEY_VIRUSTOTAL" {
  default =  "secretvirustotal_apikey"
}
variable "APIKEY_VIEWDNS" {
  default = "secretviewdns_apikey"
}
variable "APIKEY_ALIENVAULT" {
  default = "secretalienvault_apikey"
}
