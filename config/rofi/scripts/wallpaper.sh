#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers"

# Iniciar el daemon de awww si no está corriendo
if ! pidof awww-daemon >/dev/null; then
    awww-daemon &
    sleep 0.5
fi

# Selector con Rofi
SELECTED=$(
    find "$WALL_DIR" -type f | while read -r img; do
        [[ "$img" =~ \.(jpg|jpeg|png|webp|JPG|PNG)$ ]] || continue

        REL_PATH="${img#$WALL_DIR/}"
        printf "%s\0icon\x1f%s\n" "$REL_PATH" "$img"
    done | rofi \
        -dmenu \
        -i \
        -show-icons \
        -theme ~/.config/rofi/themes/wallpaper.rasi \
        -p ""
)

# Aplicar wallpaper y regenerar paleta de colores de forma 100% no interactiva
if [ -n "$SELECTED" ]; then
    FULL_PATH="$WALL_DIR/$SELECTED"

    # 1. Cambiar fondo con animación en awww
    awww img "$FULL_PATH" \
        --transition-type wipe \
        --transition-angle 30 \
        --transition-step 90 \
        --transition-duration 1

    # 2. Matugen sin pausas (toma el primer color dominante)
    matugen image "$FULL_PATH" -m dark -t scheme-tonal-spot --source-color-index 0

    # 3. Notificación
    notify-send -i "$FULL_PATH" "Wallpaper Actualizado" "$(basename "$SELECTED")"
fi
