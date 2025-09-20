#!/usr/bin/env fish
# Purpose: Kill torrent apps if no VPN/WireGuard/TUN connection is active.
# Runs under systemd with Restart=always; keep it short and idempotent.

# If no active VPN connection is detected...
if not nmcli con show --active | grep -Eiq 'wireguard|vpn|tun'
    # ...and any torrent process is running, kill it.
    if pgrep -if 'transmission|qbittorrent|deluge' >/dev/null
        pkill -if 'transmission|qbittorrent|deluge'
        echo (date --iso-8601=seconds)" torrent killed (no VPN)"
    end
end

