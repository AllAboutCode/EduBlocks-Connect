#!/bin/bash

if [ $(whoami) == 'root' ]; then
  echo 'Please do not run me as root'
  exit 1
fi

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$SCRIPT_DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

INSTALL_PATH=$(dirname $SCRIPT_DIR)
GLOBAL_BIN_PATH=/usr/local/bin

$INSTALL_PATH/server/startup-disable.sh

if [ $(basename $INSTALL_PATH) == 'edublocks' ]; then
  sudo rm -rf $INSTALL_PATH
fi

rm -f ~/connect/edublocks.desktop

sudo rm -f $GLOBAL_BIN_PATH/edublocks
sudo rm -f $GLOBAL_BIN_PATH/edublocks-connect
sudo rm -f $GLOBAL_BIN_PATH/edublocks-startup-enable
sudo rm -f $GLOBAL_BIN_PATH/edublocks-startup-disable
sudo rm -f $GLOBAL_BIN_PATH/edublocks-connect-uninstall

sudo rm -f /usr/share/icons/hicolor/scalable/apps/connectlogo.png
sudo rm -f /usr/share/icons/hicolor/scalable/apps/logo.png
sudo rm -f /usr/share/applications/edublocks-connect.desktop
sudo rm -f /usr/share/applications/edublocks.desktop

echo '==== EduBlocks has been uninstalled successfully ===='
