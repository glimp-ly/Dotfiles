#!/usr/bin/env bash

# Ruta al tema
ROFI_THEME="$HOME/.config/rofi/themes/wifi.rasi"
ROFI_CMD=(rofi -dmenu -i -p " " -config "$ROFI_THEME")
[ ! -f "$ROFI_THEME" ] && ROFI_CMD=(rofi -dmenu -i -p " ")

while true; do
    # 1. Comprobar estado de la radio Wi-Fi
    WIFI_STATE=$(nmcli -t -f WIFI g | head -n1 | tr -d '[:space:]')

    if [ "$WIFI_STATE" = "enabled" ]; then
        TOGGLE="󰤭  Disable WiFi"
    else
        TOGGLE="󰤨  Enable WiFi"
    fi

    # 2. Obtener lista de redes (usando la caché actual para que abra al instante)
    LIST=$(nmcli --terse --fields IN-USE,SSID,SECURITY,BARS device wifi list 2>/dev/null | awk -F: '
        $2 != "" && $2 != "--" {
            if (seen[$2]++) next;
            icon = ($1 == "*") ? " " : "  "
            sec  = ($3 == "" || $3 ~ /^--/) ? "" : ""
            printf "%s%-25s  %s  %s\n", icon, $2, sec, $4
        }
    ')

    # Si la lista está vacía pero el WiFi está prendido, colocar aviso
    [ -z "$LIST" ] && [ "$WIFI_STATE" = "enabled" ] && LIST="  (No networks found)"

    # 3. Construir opciones fijas
    RESCAN="󰑐  Scan Networks"
    MENU_OPTIONS=$(printf "%s\n%s\n%s" "$TOGGLE" "$RESCAN" "$LIST")

    # 4. Mostrar menú en Rofi
    CHENTRY=$(echo -e "$MENU_OPTIONS" | "${ROFI_CMD[@]}")

    # Salir si el usuario presiona ESC
    [ -z "$CHENTRY" ] && exit 0

    # 5. Evaluar acciones
    if [ "$CHENTRY" = "󰤨  Enable WiFi" ]; then
        nmcli radio wifi on
        notify-send -u low -i network-wireless-signal-excellent "WiFi" "Interfaz activada"
        sleep 1
    elif [ "$CHENTRY" = "󰤭  Disable WiFi" ]; then
        nmcli radio wifi off
        notify-send -u low -i network-wireless-offline "WiFi" "Interfaz desactivada"
        exit 0
    elif [ "$CHENTRY" = "󰑐  Scan Networks" ]; then
        notify-send -u low -i view-refresh "WiFi" "Escaneando espectro..." -t 1500
        nmcli device wifi rescan 2>/dev/null
        sleep 1.5
    elif [ "$CHENTRY" = "  (No networks found)" ]; then
        continue
    else
        # Es una red Wi-Fi seleccionada
        break
    fi
done

# 6. Extraer el SSID limpio
CHSSID=$(echo "$CHENTRY" | sed -E 's/^([ ] )?//; s/ {2,}.*//; s/[[:space:]]*$//')

# 7. Conexión
if nmcli -t -f NAME connection show | grep -Fxq "$CHSSID"; then
    if nmcli connection up "$CHSSID"; then
        notify-send -i network-wireless-signal-excellent "WiFi" "Conectado a $CHSSID"
    else
        notify-send -u critical -i dialog-error "WiFi" "Error al conectar a $CHSSID"
    fi
else
    WIFIPASS=""
    if echo "$CHENTRY" | grep -q ""; then
        WIFIPASS=$(rofi -dmenu -password -p "Contraseña ($CHSSID):" -lines 0)
        [ -z "$WIFIPASS" ] && exit 0
    fi

    if [ -n "$WIFIPASS" ]; then
        CON_RES=$(nmcli dev wifi connect "$CHSSID" password "$WIFIPASS" 2>&1)
    else
        CON_RES=$(nmcli dev wifi connect "$CHSSID" 2>&1)
    fi

    if [ $? -eq 0 ]; then
        notify-send -i network-wireless-signal-excellent "WiFi" "Conectado exitosamente a $CHSSID"
    else
        notify-send -u critical -i dialog-error "WiFi" "Fallo de conexión: $CON_RES"
    fi
fi
