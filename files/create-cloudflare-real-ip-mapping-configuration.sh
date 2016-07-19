#!/bin/sh

ipv4_url=https://www.cloudflare.com/ips-v4
ipv6_url=https://www.cloudflare.com/ips-v6

conf_file=./cloudflare-real-ip-mapping.conf

rm -f $conf_file

exec > $conf_file

echo "#cloudflare ip mapping"
echo "#see https://support.cloudflare.com/hc/en-us/articles/200170706-How-do-I-restore-original-visitor-IP-with-Nginx-"
echo "#and https://www.cloudflare.com/ips/"

curl -qs $ipv4_url | sed -e 's/^/set_real_ip_from /' -e 's/$/;/'

curl -qs $ipv6_url | sed -e 's/^/set_real_ip_from /' -e 's/$/;/'

echo "real_ip_header CF-Connecting-IP;"
