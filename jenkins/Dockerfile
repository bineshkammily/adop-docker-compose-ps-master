FROM bzon/centos-adop-jenkins:latest

# Install plugins
COPY resources/plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt

# Remove ADOP unnecessary 
RUN rm -fr /usr/share/jenkins/ref/init.groovy.d/adop_gerrit.groovy && \
    rm -fr /usr/share/jenkins/ref/init.groovy.d/adop_nodejs.groovy && \
    rm -fr /usr/share/jenkins/ref/jobs/Load_Platform

# Add custom jobs
COPY resources/jobs/ /usr/share/jenkins/ref/jobs/

# Add custom inits
COPY resources/init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/

# Disable ADOP default environment variable triggers
ENV ADOP_MAVEN_ENABLED=true \
    MAVEN_VERSION=true \
    ADOP_GERRIT_ENABLED=false \
    ADOP_SONAR_ENABLED=false \
    ADOP_NODEJS_ENABLED=false \
    SECURITY_ENABLED=false \
    ADOP_LDAP_ENABLED=false \
    JENKINS_CLI_DISABLED=false

# Offline Install Maven
RUN wget -O /tmp/apache-maven-2.2.1-bin.zip http://archive.apache.org/dist/maven/binaries/apache-maven-2.2.1-bin.zip && \
    unzip /tmp/apache-maven-2.2.1-bin.zip -d /usr/share/jenkins/ref && \
    rm -fr /tmp/apache-maven-2.2.1-bin.zip

# The source url is from Bjorn's dropbox
ARG maven_repo_installer_url="https://www.dropbox.com/s/wpjpclg5aq0n2q9/EBS_ACCELERATOR_MAVEN_REPO_OFFLINE.tar?dl=0"
ARG ojdbc6_installer_url="https://www.dropbox.com/s/k30cofgnq4dvvub/ojdbc6.jar?dl=0"

# Offline Install Maven JDBC jar 
RUN wget -O /usr/share/jenkins/ref/apache-maven-2.2.1/lib/ojdbc6.jar ${ojdbc6_installer_url} && \
    chmod +x /usr/share/jenkins/ref/apache-maven-2.2.1/lib/ojdbc6.jar

# Offline AFPO Repo install
RUN wget -O /tmp/EBS_ACCELERATOR_MAVEN_REPO_OFFLINE.tar ${maven_repo_installer_url} && \
    tar -xvf /tmp/EBS_ACCELERATOR_MAVEN_REPO_OFFLINE.tar -C /usr/share/jenkins/ref && \
    rm -fr /tmp/EBS_ACCELERATOR_MAVEN_REPO_OFFLINE.tar

RUN chown -R jenkins. /var/jenkins_home
