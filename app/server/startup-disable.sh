#!/bin/bash

sudo systemctl stop edublocks-server
sudo systemctl disable edublocks-server

sudo rm -rf /etc/systemd/system/edublocks-server.service
