#!/bin/bash

apt update
apt install nginx -y

cd /var/www/html/

for i in 1 2 3;
do
    touch page$i.html
    chmod 644 page$i.html
    chown www-data:www-data page$i.html
done

if systemctl is-active --quiet nginx.service; then
  echo "Nginx is running. Force restarting now..."
  systemctl restart nginx.service 
else
  echo "Nginx is dead. Starting it now..."
  systemctl start nginx.service
fi

journalctl -u nginx.service -n 5