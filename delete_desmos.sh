#!/bin/bash

systemctl stop desmosd.service
systemctl disable desmosd.service
rm /etc/systemd/system/desmosd.service $HOME/desmos/*.zip $HOME/desmos*
rm -rf ~/desmos/desmos* $HOME/.desmosd $HOME/.desmoscli
systemctl daemon-reload
