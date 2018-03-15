#!/bin/sh
if [ "$1" == "builder" ]; then
  shift
  exec docker build -f Dockerfile.build -t ${USER}/burp-rest-api-builder:latest . $@
else
  exec docker-compose build
fi
