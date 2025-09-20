#!/usr/bin/env fish
# Prepare and install the systemd unit to run the fish script.


set -l svc ./main/torrentvpn.service
set -l script ./main/torrentvpn.fish


# Substitute placeholders in the service file
sed -i "s/%%user%%/$USER/g" $svc
sed -i "s@%%filepath%%@$PWD/main/torrentvpn.fish@g" $svc


# Ensure the script is executable
chmod +x $script


# Install systemd service
sudo cp $svc /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable torrentvpn.service
sudo systemctl start torrentvpn.service


# Show current status (non-paging)
sudo systemctl status --no-pager torrentvpn.service
