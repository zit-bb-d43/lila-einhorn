# Lila Einhorn 

Every girl loves purple unicorns and likes to investigate suspicious IPs and URLs. Boys of course too, but girls really like analyze suspicious IPs and URLs. So we [terraform](https://www.terraform.io/) a VM that does just that.

## Features
* [dns-recon](https://github.com/darkoperator/dnsrecon) preinstalled
* [Nmap](https://nmap.org/) preinstalled
* [recon-ng](https://github.com/lanmaster53/recon-ng) preinstalled
* [VirusTotal CLI](https://github.com/VirusTotal/vt-cli) preinstalled
* optional environments variables for following APIS: virustotal.com, viewdns.info, otx.alienvault.com


## Usage

```
# install terraform if neccessary
# set http[s]_proxy if necessary
git clone https://github.com/zit-bb-d43/lila-einhorn.git
cd lila-einhorn
cp terraform.tfvars.example terraform.tfvars

# edit terraform.tfvars
# if needed, add your public ssh-key to user unicorn in lilaeinhorn.yml or add new users ...

terraform init
terraform plan
terraform apply

# login, do your foo and investigate
# ...
# ...
```

## investigate
We start a quick investigation for a first overview:
* whois <DOMAIN>|<IP>
* dig a <DOMAIN> +short
* dig -x <IP> +short
* ask virustotal API
* ask viewdns API
* ask alienvault API

```
# set vars for IP and DOMAIN if already known
export IP=<IP>
export DOM=<DOMAIN>

# if not, dns [rev] lookup
dig a $DOM +short
dig -x $IP +short

# whois
whois $DOM
whois $IP


# reverseip lookup at viewdns.info
curl "https://api.viewdns.info/reverseip/?host=${IP}&apikey=${VIEWDNS_APIKEY}&output=json" --output api.viewdns.info_${IP}_01.json
jq ".response.domains[].name" api.viewdns.info_${IP}_01.json
# if this is buggy, check balance
curl https://api.viewdns.info/account/?action=balance&apikey=${VIEWDNS_APIKEY}&output=json | jq "."

# virus total
vt ip $IP
vt domain $DOMAIN


# ask otx.alienvault.com
# ipv4 infos
for SECTION in general reputation geo malware url_list passive_dns http_scans ; do curl -s https://otx.alienvault.com/api/v1/indicators/IPv4/${IP}/${SECTION} -H "${ALIENVAULT_APIKEY}" > alienvault_ip_${IP}_${SECTION}.json ; done
jq "." alienvault_ip_${IP}*

# Domain infos, should be almost the same
for SECTION in general reputation geo malware url_list passive_dns whois http_scans ; do curl -s https://otx.alienvault.com/api/v1/indicators/IPv4/${IP}/${SECTION} -H "${ALIENVAULT_APIKEY}" > alienvault_domain_${DOM}_${SECTION}.json ; done
jq "." alienvault_domain_${DOM}*

```

for further investigations use recon-ng.


## destroy
```
cd lila-einhorn
terraform destroy
```

## ToDo
* write some scripts to do investigations and collect informations automatically
