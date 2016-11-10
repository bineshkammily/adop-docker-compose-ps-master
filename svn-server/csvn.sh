#!/bin/bash

set -e

CSVN_HOME=/var/csvn_home

start_csvn_console() {
$CSVN_HOME/csvn/bin/csvn start
}

start_appserver() {
$CSVN_HOME/csvn/bin/csvn-httpd start
tail -f $CSVN_HOME/csvn/data/logs/*.log
}

if [[ $# -lt 1 ]]; then
  start_csvn_console
  start_appserver
fi

exec "$@"
