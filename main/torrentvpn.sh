#!/bin/bash
nmcli con show --active | grep -Ei 'wireguard|vpn|tun'
vpnCode="${PIPESTATUS[1]}"
pgrep -i 'torrent'
torrentCode=$?
[[ $vpnCode == 1  && $torrentCode == 0 ]] && pkill -i 'torrent' && echo 'torrent killed'
  
  

