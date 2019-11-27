#!/bin/bash
PHP_V="$1"
# add and update sources
apt-get update \
 && apt-get install -y apt-transport-https ca-certificates \
 && apt-get install -y language-pack-en-base software-properties-common apt-utils
locale-gen en_US.UTF-8
apt-get install -y software-properties-common \
 && apt-add-repository -y ppa:ondrej/php
apt-get update

# install http & other stuff
apt-get install -y nginx nano unzip mc htop git certbot

# install mysql
apt-get install -y mysql-client mysql-server

# install php
apt-get install -y libapache2-mod-php"$PHP_V" php"$PHP_V" php"$PHP_V"-pdo php"$PHP_V"-mysql php"$PHP_V"-mbstring php"$PHP_V"-xml php"$PHP_V"-intl php"$PHP_V"-tokenizer php"$PHP_V"-gd php"$PHP_V"-imagick php"$PHP_V"-curl php"$PHP_V"-zip php"$PHP_V"-bcmath php"$PHP_V"-mysql php"$PHP_V"-mbstring php-ssh2
