#!/bin/bash

if [ $(whoami) == 'root' ]; then
  echo 'Please do not run me as root'
  exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PROJECT_PATH=$SCRIPT_DIR

NODE_PATH=$PROJECT_PATH/../bin/node

cd $PROJECT_PATH

ARCH=$(uname -m)

if [ $ARCH != 'armv6l' ]; then
  sleep 10

  chromium-browser --app=http://localhost:8081/
else
  # Give the poor little Raspberry Pi time to start the server...
  sleep 20

  chromium-browser --app=http://localhost:8081/
fi
