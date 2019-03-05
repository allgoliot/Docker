
#! /bin/bash

echo "*** Removing docker ***"

sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
echo "*** Installing docker ***"
sudo yum install -y docker-ce docker-ce-cli containerd.io

echo "Docker installed "
docker --version
echo ""

echo "*** Installing docker-compose ***"

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname 
-s)-$(uname -m)" -o /usr/local/bin/docker-compose


sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "Docker-compose installed"
docker-compose --version
