#!/bin/bash
yum update -y

# Install Docker
amazon-linux-extras install docker -y

# Start Docker
systemctl start docker
systemctl enable docker

# Allow ec2-user to run docker without sudo
usermod -aG docker ec2-user

# Install Docker Compose (optional)
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
    