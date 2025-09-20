#!/usr/bin/env fish
# Prepare and install the systemd *user* unit to run the fish script.

set -l svc ./main/torrentvpn.service
set -l script ./main/torrentvpn.fish

# Substitute filepath placeholder only
sed -i "s@%%filepath%%@$PWD/main/torrentvpn.fish@g" $svc

# Ensure the script is executable
chmod +x $script

# Install systemd service (user)
mkdir -p ~/.config/systemd/user
cp $svc ~/.config/systemd/user/

systemctl --user daemon-reload
systemctl --user enable torrentvpn.service
systemctl --user start torrentvpn.service

# Show current status (non-paging)
systemctl --user status --no-pager torrentvpn.service

