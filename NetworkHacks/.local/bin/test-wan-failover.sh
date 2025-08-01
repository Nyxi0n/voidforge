#!/usr/bin/env bash
#
# ~/.local/bin/test-wan-failover.sh — simulate WAN fail-over & back

set -euo pipefail

IFACE="eno1"
FAILOVER_SCRIPT="$HOME/.local/bin/nm-wan-failover.sh"
DOWN_WAIT=5   # seconds to wait before triggering fail-over check
UP_WAIT=5     # seconds to wait before triggering fail-back check

echo "⏬ Bringing down $IFACE..."
sudo ip link set "$IFACE" down

echo "⏳ Waiting $DOWN_WAIT s for link state to settle..."
sleep "$DOWN_WAIT"

echo "⚙️  Running fail-over check..."
sudo "$FAILOVER_SCRIPT"

echo "🌐 Default route now (should be via wlan0):"
ip route show default || echo "(none)"

echo
echo "⏫ Bringing up $IFACE..."
sudo ip link set "$IFACE" up

echo "⏳ Waiting $UP_WAIT s for link state to settle..."
sleep "$UP_WAIT"

echo "⚙️  Running fail-back check..."
sudo "$FAILOVER_SCRIPT"

echo "🌐 Default route now (should be via eno1):"
ip route show default || echo "(none)"

echo "✅ Test complete."
