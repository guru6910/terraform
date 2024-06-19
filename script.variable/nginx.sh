#!/bin/bash
  sudo apt update -y
  sudo apt install apache2 -y
  sudo systemctl start apache2
  echo "hello aarohi " > /var/www/html/index.html