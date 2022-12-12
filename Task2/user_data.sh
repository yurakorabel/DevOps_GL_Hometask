#!/bin/bash

sudo apt -y update
sudo apt -y install apache2
sudo chmod -R 777 /var/www/html

echo "<h1>Yura Korabel $(hostname -i)</h1>" > /var/www/html/index.html
