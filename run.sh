#!/bin/sh
if [ "$1" == "builder" ]; then
  shift
  exec docker run --rm -it ${USER}/burp-rest-api-builder $@
else
  exec docker-compose up burp $@
fi
