#!/bin/bash
if [ $(whoami) == 'root' ]; then
  echo "Please do not run me as root"
  exit 1
fi

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

EXTRACT_PATH=$SCRIPT_PATH

if [ -f ~/.config/chromium/Default/Preferences ]; then
  echo "Changing Chromium preferences to ask for directory upon saving a download..."
  sed -i 's/"download":{"directory_upgrade":true}/"download":{"directory_upgrade":true,"prompt_for_download":true}/g' ~/.config/chromium/Default/Preferences
fi

echo "Installing EduBlocks Python Libraries.."
sudo pip3 install python-sonic blinkt explorerhat 'ipython==6.0.0' cs20-microbitio