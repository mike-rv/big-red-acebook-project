#!/bin/bash
# This is a simple after install script for a Node.js application
echo "Running after install script"
echo "Installing Node.js and npm"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "Installing application dependencies"
cd /var/www/myapp
npm install