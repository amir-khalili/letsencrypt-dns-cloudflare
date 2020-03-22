while read -p " Enter your domain [ done to stop ]: ) " domains
do
    [ "$domains" == "done" ] && break
    fulldomains=("${fulldomains[@]}" $domains)
done
cnt=${#array[@]}
for ((i=0;i<cnt;i++)); do
    fulldomains[i]=" -d ${fulldomains[i]}"
done
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials /var/root/.secrets/cloudflare.ini  ${fulldomains[*]} --preferred-challenges dns-01
