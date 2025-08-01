#!/usr/bin/env bash
# create_staffeln.sh — Nur Staffel-Ordner erstellen
# Usage: ./create_staffeln.sh <Anzahl_der_Staffeln>
# Beispiel: ./create_staffeln.sh 5

# 1️⃣ Prüfen, ob eine gültige Zahl übergeben wurde
if [[ -z "$1" || ! "$1" =~ ^[0-9]+$ ]]; then
  echo "❌ Usage: $0 <Anzahl_der_Staffeln>"
  exit 1
fi

MAX=$1

# 2️⃣ Erstelle Ordner Staffel 1 … Staffel $MAX
for (( i=1; i<=MAX; i++ )); do
  dirname="Staffel $i"
  mkdir -p "$dirname"
  echo "📂 **Erstellt:** $dirname"
done

# 3️⃣ Abschluss-Nachricht
echo "✨ **Fertig!** $MAX Staffeln wurden erstellt, onii-chan~! (｡◕‿◕｡)💕"