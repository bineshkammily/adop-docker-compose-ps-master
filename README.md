# Sypnosis
-----
This is a project for composing the EBS accelerator stack that includes:  

  - AFPO EBS Accelerator
  - PostgreSQL Database for EBS Accelerator
  - Jenkins for EBS Accelerator
  - Collabnet SVN Edge
  - OpenLDAP
  - LDAP Management tools
  - Nginx Proxy

# Requirements
-----
- Install [docker-engine](https://docs.docker.com/engine/installation/) 1.9 or higher
- Install [docker-compose](https://docs.docker.com/compose/install/) 1.6 or higher 
- Install git

# Quickstart Installation Guide
-----
- Clone the project.
```bash
https://john.bryan.j.sazon@newsource.accenture.com/scm/adopebs/acn-ebs-accelerator-docker.git
cd acn-ebs-accelerator-docker/
```
- Export the initial administrator user credentials.
```bash
export INITIAL_ADMIN_USER="juan.smith"
export INITIAL_ADMIN_PASSWORD_PLAIN="password1234"
```
- Run installation wrapper script.
```bash
./init.sh
```
- Output when completed.
```bash
==============================================================================
EBS Accelerator deployment completed at 83(s)..
You can access your Landing page now! @ http://<YOUR.HOST.IP>/
Before you access Jenkins and load the accelerator cartridge,
Please copy and paste the following in your enterprise account profile at [https://newsource.accenture.com].
==============================================================================
-------------- DO NOT COPY THIS ---------------->

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCsceop9AWcsu0kNLWt8iW70itCilSMItcxki2Equ4I37bQPUzAXMNjCMs4gcnPYdz6JqBwn/0t42A9U5ONekVL68Xhlay36iu7bZPyqadac7dk05QW3+vMhEAPiw2fP6kflZZgMq/1QjHBrIlM3SCuvE421oqMFji1Ps/Q7QrQov6HhRgnFhGRtuGKPqyJQOROEu2N3KBHRwMiogk//BGzAUKn7+JcNr/JPOvZx71C5z5M8EKkumqv6fBmtXf6QQAQrELFtx3EhLbsWldngwLtubQwOXTAG4jygRxTC85wbmGa8NouTtbjqsmLDcQze9pDd5GaEFZI5bGViamw8vBHFa1idHcVoUQOjD5raK1RmtOft3CbqvfWS7Vnsfc5nzf3HbxjIyaqd7EXSMsFCPoLLpkMIYI8ktTljIhqGHIgh0sthGgaDIUC2J6SVDxLTcL3rJK6ZtZcOS3N4XKwfA1mNWXmnMrXrZyrt7yHeO00+YW5coQZB0U8KYP1wMmk9BoUcDKW7kzccMZR9hJFmm+xUj+saFlDI7ytS9r9D5RTOwU+v/DuxZGgp+HL4xVNclJnt58NNbWSX1NUZPECjIrzIdU7H5gCNl6Cp59fP1NN2PGUpnC7gKP34I+WuPC7h69T/fXxKRd9t/4AVaeiwB7amUjjLtEJ8VPrfJlKpj1W3Q== jenkins@adop-core

-------------- DO NOT COPY THIS ---------------->

==============================================================================
Your credentials are saved in platform.secrets.sh
==============================================================================
OVERALL ADMIN USER: admin
ADMIN PASSWORD: 5ffa831ecbce10169
JENKINS USER: jenkins
JENKINS PASSWORD: 55441658507a5957
POSTGRES USER: postgres
POSTGRES PASSWORD: 613fa6511cec3056
```

# General Installation Guide
-----

This is only what you need to do to install everything.

```bash
export INITIAL_ADMIN_USER="juan.smith"
export INITIAL_ADMIN_PASSWORD_PLAIN="password1234"
source credentials.generate.sh
source env.config.sh
docker-compose up -d
```

