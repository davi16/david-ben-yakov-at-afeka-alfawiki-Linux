#!/bin/bash

docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 -d mysql:latest

docker run --name some-mediawiki -p 8080:80 -d mediawiki

sudo apt update

sudo apt install mysql-client-core-8.0

mysqladmin -h 127.0.0.1 -u root -pmy-secret-pw create my_wiki

gunzip < my-wiki.backup.sql.gz | mysql -h 127.0.0.1 -u root -pmy-secret-pw my_wiki

docker cp LocalSettings.php some-mediawiki:/var/www/html/LocalSettings.php

docker cp myWikiLogo.jpg some-mediawiki:/var/www/html/images/myWikiLogo.jpg

docker restart some-mediawiki

