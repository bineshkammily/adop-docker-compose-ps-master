#!/bin/bash -e

echo "Starting ERP manager.."
erp_manager_log="/var/log/acn_erp_manager/acn_erp_manager.log"
su - acn_erp_manager -c "touch $erp_manager_log"
su - acn_erp_manager -c "/usr/bin/java -Dserver_port=8090 -jar /var/lib/acn_erp_manager/lib/EBS_RICEW_MANAGER_WEBAPP.jar" &
tail -f ${erp_manager_log}
