#!/bin/bash
currentDir=$(pwd)
sed -i s/%%user%%/"$USER"/g ./main/torrentvpn.service
sed -i s@%%filepath%%@"$currentDir"/main/torrentvpn.sh@g ./main/torrentvpn.service
sudo mv ./main/torrentvpn.service /etc/systemd/system/
chmod +x ./main/torrentvpn.sh
systemctl enable torrentvpn.service
systemctl start torrentvpn.service
systemctl status torrentvpn.service
