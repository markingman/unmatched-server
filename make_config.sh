#!/bin/sh

sed -e ':a' -e 'N' -e '$!ba' -e 's/\t//g' -e 's/\n//g' error400.html > error400.html.tmp

awk -v new_content="		return 400 '$(cat error400.html.tmp)';" '/return 400;/ {print new_content; next} 1' nginx.conf.tmpl > nginx.conf

rm error400.html.tmp
