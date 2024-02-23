#!/bin/bash

set -e

start_nginx() {
  echo "Start nginx done"
  $NGINX_HOME/sbin/nginx -c $NGINX_HOME/conf/nginx.conf
  echo "Start nginx done"
  echo -e "\n"
}

stop_nginx() {
  echo "Stop nginx"
  $NGINX_HOME/sbin/nginx -s stop
  echo "Stop nginx done"
  echo -e "\n"
}

reload_nginx() {
  echo "Reload nginx done"
  $NGINX_HOME/sbin/nginx -s reload
  echo "Reload nginx done"
  echo -e "\n"
  echo "wait 5 sec"
  sleep 5
}

# Usage:
# bash /home/buercorp/deploy/scripts/nginx/nginx_conf.sh admin-api beta operation

# PROJECT [admin-api, portal-api]
PROJECT=$1
# PROFILE [dev, test, real]
PROFILE=$2
# OPERATION [start, restart, reload]
OPERATION=$3

NGINX_HOME=/home/buercorp/apps/nginx
CONF_NGINX_DIR=/home/buercorp/deploy/scripts/nginx
CONF_NGINX_CONF=/home/buercorp/deploy/scripts/nginx/$PROFILE/$PROJECT/nginx.conf
SSL_DIR_PATH=/home/buercorp/deploy/scripts/nginx/$PROFILE/ssl

#nginx service
if [ $3 == "restart" ]; then
  stop_nginx
fi

#Config nginx
echo "Config nginx: copy nginx.conf"
cp $CONF_NGINX_CONF $NGINX_HOME/conf/

#Config ssl
mkdir -p  $NGINX_HOME/conf/ssl/
cp -r $SSL_DIR_PATH/* $NGINX_HOME/conf/ssl/
chmod -R 775 $NGINX_HOME/conf/ssl

sleep 1

#nginx service
if [ $3 == "reload" ]; then
	reload_nginx
else
	start_nginx
fi
