#!/bin/bash
nmcli con show --active | grep -Ei 'wireguard|vpn|tun'
vpnCode="${PIPESTATUS[1]}"
pgrep -i 'torrent'
torrentCode=$?
if [[ $vpnCode == 1 ]] && [[ $torrentCode == 0 ]]; then
  pkill -i 'torrent'
  echo 'torrent killed'
else
  echo ''
fi

