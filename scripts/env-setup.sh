#!/bin/bash

set -e

echo "Updating packages"
sudo apt update

echo "Installing Docker"
sudo apt install docker.io -y

echo "Installing Node.js"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install nodejs -y

echo "Installing Git"
sudo apt install git -y

echo "Enabling Docker"
sudo systemctl enable docker
sudo systemctl start docker

echo "Environment setup completed"
