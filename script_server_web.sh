#!/bin/bash

pacman -Syu
pacman -S apache unzip

git clone https://github.com/denilsonbonatti/linux-site-dio /tmp/linux-site-dio

cp -R /tmp/linux-site-dio /var/www/http
