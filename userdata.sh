#!/bin/bash
# Update and install Nginx
sudo apt update -y
sudo apt install nginx -y

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Create a basic webpage
echo "<!DOCTYPE html>
<html>
  <head>
    <title>My Portfolio on AWS</title>
    <meta charset="UTF-8">
  </head>
  <body style="font-family:sans-serif; text-align:center; margin-top:100px;">
    <h1>Hello from AWS EC2!</h1>
    <p>This website is hosted on a free-tier EC2 instance using Nginx and Terraform.</p>
  </body>
</html>" | sudo tee /var/www/html/index.html

