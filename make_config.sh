#!/bin/sh

# Create Nginx config for COPY in Dockerfile

source .env

sed -e ':a' -e 'N' -e '$!ba' -e 's/\t//g' -e 's/\n//g' error400.html > error400.html.tmp
sed -e ':a' -e 'N' -e '$!ba' -e 's/\t//g' -e 's/\n//g' error503.html > error503.html.tmp

awk -v new_content="		return 400 '$(cat error400.html.tmp)';" '/return 400;/ {print new_content; next} 1' nginx.conf.tmpl > nginx.conf.tmpl.tmp

awk -v new_content="	server_name $HOST *.$HOST;" '/server_name example.com;/ {print new_content; next} 1' nginx.conf.tmpl.tmp > nginx.conf.tmpl.tmp2
awk -v new_content="		return 200 '$(cat error503.html.tmp)';" '/return 200;/ {print new_content; next} 1' nginx.conf.tmpl.tmp2 > nginx.conf

rm error400.html.tmp
rm error503.html.tmp
rm nginx.conf.tmpl.tmp
rm nginx.conf.tmpl.tmp2
