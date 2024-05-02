echo "Start update of cdelgado.duckdns.org"

url="https://www.duckdns.org/update?domains=cdelgado&token=<DUCK_DNS_TOKEN>&ip="

output=$(curl -k $url)

echo "Finished update of cdelgado.duckdns.org"