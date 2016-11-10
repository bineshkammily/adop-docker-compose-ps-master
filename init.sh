#!/bin/bash -e

echo "=============================================================================="
echo "Author: Sazon, John Bryan J. <john.bryan.j.sazon@accenture.com> - The DevOps Cowboy "
echo "=============================================================================="
docker version
echo "=============================================================================="
docker-compose version
echo "=============================================================================="

echo "Do you want to perform a clean installation?"
echo "WARNING: Clean installation removes all existing docker containers and their volumes."
echo "[Y/N]: "
read line

if [[ $line = [Yy][Ee][Ss] ]] || [[ $line = [Yy] ]]; then

  echo "Cleaning up containers.."
  ./rm-containers.sh | true
  echo "Cleaning up volumes.."
  yes | ./clean-up-volumes.sh | true

fi

echo "Deployment starts.."
start=$SECONDS
source env.config.sh
rm -f platform.secrets.sh
source credentials.generate.sh
docker-compose up -d

COUNT=0
MAX_RETRIES=20
until [[ $(curl -I -s ${INITIAL_ADMIN_USER}:${INITIAL_ADMIN_PASSWORD_PLAIN}@localhost|head -n 1|cut -d$' ' -f2) == 200 ]] || [[ $COUNT -gt $MAX_RETRIES ]]; do
  echo "[INFO]: Waiting for the Landing page to come up.. Sleeping 5(s)"
  sleep 5
done 

if [[ $COUNT -gt $MAX_RETRIES ]]; then
  echo "$COUNT/$MAX_RETRIES max retries has been reached.."
  echo "Please run 'docker-compose logs -f' to see what's going on."
  exit 1
fi

duration=$(( SECONDS - start ))
echo "=============================================================================="
echo "EBS Accelerator deployment completed at $duration(s).."
echo "You can access your Landing page now! @ http://<YOUR.HOST.IP>/"
echo "Before you access Jenkins and load the accelerator cartridge, "
echo "Please copy and paste the following in your enterprise account profile at [https://newsource.accenture.com]."
echo "=============================================================================="
echo "-------------- DO NOT COPY THIS ---------------->"
echo ""
docker exec jenkins cat /var/jenkins_home/userContent/id_rsa.pub
echo ""
echo "-------------- DO NOT COPY THIS ---------------->"
echo ""
echo "=============================================================================="
echo "Your credentials are saved in platform.secrets.sh"
echo "=============================================================================="
echo "OVERALL ADMIN USER: ${INITIAL_ADMIN_USER}"
echo "ADMIN PASSWORD: ${INITIAL_ADMIN_PASSWORD_PLAIN}"
echo "JENKINS USER: jenkins"
echo "JENKINS PASSWORD: ${PASSWORD_JENKINS}"
echo "POSTGRES USER: postgres"
echo "POSTGRES PASSWORD: ${PASSWORD_SQL}"

