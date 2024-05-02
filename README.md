![togepiddns srcupdateddnssh](https://cronitor.io/badges/H0zpoB/production/Gwcoa5SkUyiswLGj49682bZe8bU.svg)

# ddns config

I have a couple of bare metal servers in which I usually test and deploy applications when needed. To access them I can create a dns record pointing to my public ip. The problem with this aproach is that my internet provider only assigns dynamic ips, and all the routing can stop working anytime. 

To solve this issue I have configured a dynamic dns service that will be updated regularly from any of my servers. The real dns will resolve the ip using this intermediate ddns. 


## Details 

The ddns is updated by a script, which is triggered by a cron in a container. The repository includes the Dockerfile to create the container image. 

The script sends an https request to duckdns in order to update the ddns record. 

## Configuration and requirements

- [DuckDNS](https://www.duckdns.org/): Create a subdomain and set up the api key in the **update_ddns.sh** script.
- [Cronitor](https://cronitor.io/): Create an account and set up the api key in the **Dockerfile**


## Executing

```
docker build -t cdelgado:cron .
docker run cdelgado:cron
```

