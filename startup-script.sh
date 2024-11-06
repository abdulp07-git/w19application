#!/bin/bash


# Fetch token for IMDSv2
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Use the token to fetch public IP
PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)


export DJANGO_ALLOWED_HOSTS="$PUBLIC_IP"

# Navigate to your Django app and start the server
cd /home/ubuntu 
source myenv/bin/activate
python week18-djangoApp/manage.py runserver 0.0.0.0:8000
