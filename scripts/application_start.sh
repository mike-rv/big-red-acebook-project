#!/bin/bash
# This is a simple application start script for a Node.js application
echo "Running application start script"
echo "Restarting application with PM2"
cd /var/www/myapp

# Restart the application with PM2
pm2 start ./bin/www --name myapp