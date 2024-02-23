#!/bin/bash

set -e

cd /home/buercorp
wget --no-check-certificate https://nginx.org/download/nginx-1.24.0.tar.gz
tar xvf nginx-1.24.0.tar.gz -C downloads
rm nginx-1.24.0.tar.gz
cd downloads/nginx-1.24.0
wget --no-check-certificate https://www.openssl.org/source/openssl-3.0.12.tar.gz
tar xvf openssl-3.0.12.tar.gz
rm openssl-3.0.12.tar.gz
./configure --prefix=/home/buercorp/apps/nginx-1.24.0 --user=buercorp --group=buercorp --error-log-path=/home/buercorp/logs/nginx/error.log --http-log-path=/home/buercorp/logs/nginx/access.log --with-openssl=openssl-3.0.12 --with-http_realip_module --with-http_ssl_module --without-http_scgi_module --without-http_uwsgi_module --without-http_fastcgi_module
make
make install

cd /home/buercorp/apps
sudo ln -s nginx-1.24.0 nginx

#/sbin/setcap 'cap_net_bind_service=+ep' /home/buercorp/apps/nginx/sbin/nginx
