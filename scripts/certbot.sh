#!/bin/sh

# Check for existing self-signed certificate
if [ ! -f /etc/letsencrypt/selfsigned.crt ]; then
    echo "Generating self-signed certificate..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/letsencrypt/selfsigned.key \
        -out /etc/letsencrypt/selfsigned.crt \
        -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"
else
    echo "Using existing self-signed certificate."
fi

# Start Nginx
nginx -g 'daemon off;'
