#!/bin/bash
# Requisito: socat (sudo pacman -S socat)

SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

# Escuchar los eventos de IPC de Hyprland en tiempo real
socat -U - UNIX-CONNECT:"$SOCKET" | while read -r line; do
    # Cuando se conecta el monitor HDMI-A-1
    if [[ "$line" == monitoradded*HDMI-A-1* ]]; then
        sleep 1
        mkdir -p ~/.config/caelestia/monitors/HDMI-A-1
        cp ~/.config/caelestia/templates/HDMI-A-1.json ~/.config/caelestia/monitors/HDMI-A-1/shell.json
        caelestia shell -r
    fi
done
