#!/usr/bin/env fish
# Purpose: Kill torrent apps if no VPN/WireGuard/TUN connection is active.

# If no active VPN connection is detected...
if not /usr/bin/nmcli --terse --color no con show --active | grep -Eiq 'wireguard|vpn|tun'
    # ...and any torrent process is running, kill it.
    if /usr/bin/pgrep -if 'transmission|qbittorrent|deluge' >/dev/null
        /usr/bin/pkill -if 'transmission|qbittorrent|deluge'
        /usr/bin/logger -t torrentvpn (/usr/bin/date --iso-8601=seconds)" torrent killed (no VPN)"
    end
end

