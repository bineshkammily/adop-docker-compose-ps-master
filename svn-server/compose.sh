#!/bin/bash

set -e

case $1 in
'test')
 docker-compose stop && docker-compose rm -f
 rm -fr data
 mkdir -p ./data/csvn
 chown -R 1100:1100 ./data
 docker-compose up -d
;;
'clean')
  docker-compose stop && docker-compose rm -f
  rm -fr data
;;
*)
 echo "clean|test"
;;

esac
