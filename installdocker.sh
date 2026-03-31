#!/bin/bash

sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
echo "Docker is Installed & Running"
docker --version
