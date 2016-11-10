#!/bin/bash

docker build -t ebs-nginx .
docker rm -f ebs-nginx
docker volume rm nginx_config nginx_releasenote
docker run -p 80:80 --net=${CUSTOM_NETWORK_NAME} -v nginx_config:/etc/nginx \
	-v nginx_releasenote:/usr/share/nginx/html \
	--name ebs-nginx -d ebs-nginx
