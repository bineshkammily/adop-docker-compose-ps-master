#!/bin/bash

echo "[WARNING!] This script cleans up unused volumes of your dead container."
echo "Please confirm with yes if you want to proceed. [Y/N]: "
read line

if [[ $line = [Yy][Ee][Ss] ]] || [[ $line = [Yy] ]]; then
  echo "Cleaning up.."
  docker volume rm $(docker volume ls -qf dangling=true)
fi
