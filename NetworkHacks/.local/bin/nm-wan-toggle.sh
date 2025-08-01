#!/usr/bin/env bash
#
# nm-wan-toggle.sh — flip default-route then notify

set -euo pipefail

# Gateways & devices
GW1=192.168.178.1; DEV1=eno1; MET1=100
GW2=172.20.10.1; DEV2=wlan0; MET2=600

# 1) Read current default gateway
CUR=$(ip route show default | head -n1 | awk '{for(i=1;i<=NF;i++) if($i=="via") print $(i+1)}')

# 2) Decide target
if [[ "$CUR" == "$GW1" ]]; then
  TGW=$GW2; TDEV=$DEV2; TMET=$MET2; TNAME="iPhone15"
else
  TGW=$GW1; TDEV=$DEV1; TMET=$MET1; TNAME="FritzBoxLAN"
fi

# 3) Remove any stale defaults (both variants)
sudo ip route del default via $GW1 dev $DEV1 metric $MET1 2>/dev/null || true
sudo ip route del default via $GW2 dev $DEV2 metric $MET2 2>/dev/null || true

# 4) Add the one we want
sudo ip route add default via $TGW dev $TDEV metric $TMET

# 5) Notify (makoctl or fallback)



notify-send "WAN Toggle" "Now routing via $TNAME"

