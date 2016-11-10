FROM centos:latest

MAINTAINER John Bryan Sazon <bryansazon@hotmail.com;john.bryan.j.sazon@accenture.com>

RUN yum -y update; yum clean all
RUN yum -y install sudo java-1.7.0-openjdk-devel.x86_64 wget unzip; yum clean all

ARG user=csvn
ARG group=csvn
ARG uid=1100
ARG gid=1100
ARG installer=https://s3-eu-west-1.amazonaws.com/oracle-blueprint/CollabNetSubversionEdge-5.1.1_linux-x86_64.tar.gz

ENV CSVN_HOME /var/csvn_home

# CSVN is run with user `csvn`, uid = 1100
# If you bind mount a volume from the host or a data container, 
# ensure you use the same uid
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$CSVN_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user} \
    && mkdir -p $CSVN_HOME

# Use tini as subreaper in Docker container to adopt zombie processes
ENV TINI_SHA 066ad710107dc7ee05d3aa6e4974f01dc98f3888
RUN curl -fsSL https://github.com/krallin/tini/releases/download/v0.5.0/tini-static -o /bin/tini && chmod +x /bin/tini \
  && echo "$TINI_SHA /bin/tini" | sha1sum -c -

# Download CSVN Installer from a public repository
RUN wget -O /tmp/installer.tar.gz ${installer} && \
    tar -xvf /tmp/installer.tar.gz -C $CSVN_HOME && \
    rm -fr /tmp/installer.tar.gz

# Set initial memory handling
RUN sed -i 's/wrapper.java.initmemory=64/wrapper.java.initmemory=512/g' $CSVN_HOME/csvn/data/conf/csvn-wrapper.conf && \
     sed -i 's/wrapper.java.maxmemory=512/wrapper.java.maxmemory=2048/g' $CSVN_HOME/csvn/data/conf/csvn-wrapper.conf

RUN chown -R ${user}. "$CSVN_HOME"

# CSVN home directory is a volume, so configuration and svn repos
# can be persisted and survive image upgrades
VOLUME /var/csvn_home

EXPOSE 80 443 3343 4434

COPY ./csvn.sh /csvn.sh
ENV RUN_AS_USER ${user}

ENTRYPOINT ["/bin/tini","--","/csvn.sh"]

