#!/bin/sh

# Create long lasting self-signed certificarte for COPY in Dockerfile

openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -keyout server.key -out server.crt
