#!/bin/bash
docker-compose -f compose-dev.yml up -d
IP=`hostname -I | awk '{print $1}'`
PORT=':8787'
echo "-----------------------------------------"
echo "Open RStudio by going to"
echo "http://$IP$PORT"
echo "And enter 'graydon' as user and password"
echo "-----------------------------------------"
