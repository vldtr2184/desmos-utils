#!/bin/bash

systemctl stop desmos.service
systemctl disable desmos.service
rm /etc/systemd/system/desmos.service $HOME/desmos/*.zip

rm -rf ~/desmos/desmos* $HOME/.desmosd