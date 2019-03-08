#! /bin/bash

if [ -f /bin/docker ] 
then
	echo "Docker & Docker-compose déjà installé"
	echo "Lancement du site"
else
	./install.sh	
fi

cd wordpress/with_mysql/
systemctl start docker 
docker-compose up
