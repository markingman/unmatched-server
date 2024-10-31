FROM nginx:1.27.2-alpine

# Config made with ./make_config.sh
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Self-signed cert made with ./make_cert.sh
COPY ./server.crt /etc/nginx/server.crt
COPY ./server.key /etc/nginx/server.key
