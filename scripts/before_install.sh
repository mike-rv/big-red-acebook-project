#!/bin/bash
# This is a before install script for a Node.js application on Amazon Linux 2

echo "Running before install script"
echo "Updating package list"
sudo yum update -y

# Install Node.js and npm if not already installed
echo "Installing Node.js"
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install -y nodejs

# Optionally, install build tools to compile and install native addons from npm
echo "Installing build tools"
sudo yum groupinstall -y 'Development Tools'

# Add MongoDB repository
echo "Adding MongoDB repository"
echo '[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc' | sudo tee /etc/yum.repos.d/mongodb-org-4.4.repo

# Install MongoDB
echo "Installing MongoDB"
sudo yum install -y mongodb-org

# Start and enable MongoDB service to start on boot
echo "Starting and enabling MongoDB service"
sudo systemctl start mongod
sudo systemctl enable mongod

echo "Before install script completed"
