#!/usr/bin/env bash
#
# nm-wan-failover.sh — minimal, atomic route-only fail-over

set -euo pipefail

GW1=192.168.178.1; DEV1=eno1; MET1=100
GW2=172.20.10.1; DEV2=wlan0; MET2=600
PINGS=1

if ping -c${PINGS} -W1 -I${DEV1} ${GW1} &>/dev/null; then
  ip route replace default via ${GW1} dev ${DEV1} metric ${MET1}
  logger -t nm-wan-failover "Fail-back → eno1; $(ip route show default | head -n1)"
else
  ip route replace default via ${GW2} dev ${DEV2} metric ${MET2}
  logger -t nm-wan-failover "Fail-over → wlan0; $(ip route show default | head -n1)"
fi

