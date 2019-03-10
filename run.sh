#! /bin/bash

if [ -f /bin/docker ] 
then
	echo "Docker & Docker-compose déjà installé"
	echo "Lancement du site"
else
	./install.sh	
fi
sudo systemctl start docker
sudo docker-compose up -d
sudo docker cp sources.list wordpress:/etc/apt/
sudo docker exec wordpress apt update
sudo docker exec wordpress apt-get -y install certbot python-certbot-apache -t stretch-backports
sudo docker exec -it wordpress certbot --apache

