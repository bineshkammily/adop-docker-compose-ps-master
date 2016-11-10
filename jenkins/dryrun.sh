#!/bin/bash

docker build -t jenkins-test .
docker-compose up -d
