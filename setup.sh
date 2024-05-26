#!/bin/bash
sed -i s/%%user%%/"$USER"/g ./main/torrentvpn.service
sed -i s@%%filepath%%@"$PWD"/main/torrentvpn.sh@g ./main/torrentvpn.service
sudo cp ./main/torrentvpn.service /etc/systemd/system/
chmod +x ./main/torrentvpn.sh
sudo systemctl enable torrentvpn.service
sudo systemctl start torrentvpn.service
sudo systemctl status torrentvpn.service
