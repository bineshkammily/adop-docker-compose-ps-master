FROM centos:latest
MAINTAINER John Bryan Sazon <john.bryan.j.sazon@accenture.com>

RUN yum -y update; yum clean all
RUN yum -y install postgresql-jdbc; yum clean all

# Ricewmanager webapp install
RUN cd /tmp; curl -O https://s3-eu-west-1.amazonaws.com/oracle-blueprint/ACN_ERP_MANAGER_WEBAPP-2.0.3.jar && \
    useradd -m acn_erp_manager && \
    mkdir -p /var/lib/acn_erp_manager/lib  && \
    mkdir -p /var/log/acn_erp_manager && \
    chown acn_erp_manager. /var/lib/acn_erp_manager /var/log/acn_erp_manager && \
    cp /tmp/ACN_ERP_MANAGER_WEBAPP-2.0.3.jar /var/lib/acn_erp_manager/lib && \
    cd /var/lib/acn_erp_manager/lib; ln -sv ACN_ERP_MANAGER_WEBAPP-2.0.3.jar EBS_RICEW_MANAGER_WEBAPP.jar && \
    chown -R acn_erp_manager. /var/lib/acn_erp_manager && \
    chmod +x /var/lib/acn_erp_manager/lib/ACN_ERP_MANAGER_WEBAPP-2.0.3.jar && \
    rm -f /tmp/*.jar

EXPOSE 8090

ADD ./start_ricewmanager.sh /start_ricewmanager.sh

CMD ["/bin/bash", "/start_ricewmanager.sh"]
