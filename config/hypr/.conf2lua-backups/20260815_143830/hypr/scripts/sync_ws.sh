#!/bin/bash
# Requisito: jq instalado (sudo pacman -S jq)

# Definir los nombres exactos de tus monitores
MON_MAIN="eDP-1"
MON_SEC="HDMI-A-1"

declare -A MAP_MAIN_TO_SEC
declare -A MAP_SEC_TO_MAIN
ORDERED_KEYS=()

# Generar mapeo dinámico: 1..10 (eDP-1) <-> 11..20 (HDMI-A-1)
for i in {1..10}; do
    sec=$((i + 10))
    MAP_MAIN_TO_SEC[$i]=$sec
    MAP_SEC_TO_MAIN[$sec]=$i
    ORDERED_KEYS+=($i)
done

NUM_KEYS=${#ORDERED_KEYS[@]}

# Obtener workspace activo actual
ACTIVE_WS=$(hyprctl activeworkspace -j | jq '.id')

# Determinar a qué pareja pertenece el workspace activo
CURRENT_KEY=""
if [[ -n "${MAP_MAIN_TO_SEC[$ACTIVE_WS]}" ]]; then
    CURRENT_KEY=$ACTIVE_WS
elif [[ -n "${MAP_SEC_TO_MAIN[$ACTIVE_WS]}" ]]; then
    CURRENT_KEY=${MAP_SEC_TO_MAIN[$ACTIVE_WS]}
else
    CURRENT_KEY=${ORDERED_KEYS[0]}
fi

# Buscar el índice en la secuencia
CURRENT_INDEX=-1
for i in "${!ORDERED_KEYS[@]}"; do
   if [[ "${ORDERED_KEYS[$i]}" -eq "$CURRENT_KEY" ]]; then
       CURRENT_INDEX=$i
       break
   fi
done

# Calcular el workspace destino
TARGET_KEY=""

if [[ "$1" == "+1" ]]; then
    NEXT_INDEX=$(( (CURRENT_INDEX + 1) % NUM_KEYS ))
    TARGET_KEY=${ORDERED_KEYS[$NEXT_INDEX]}
elif [[ "$1" == "-1" ]]; then
    NEXT_INDEX=$(( (CURRENT_INDEX - 1 + NUM_KEYS) % NUM_KEYS ))
    TARGET_KEY=${ORDERED_KEYS[$NEXT_INDEX]}
else
    TARGET_KEY=$1
fi

WS_MAIN=$TARGET_KEY
WS_SEC=${MAP_MAIN_TO_SEC[$TARGET_KEY]}

if [[ -z "$WS_SEC" ]]; then
    exit 0
fi

# --- CAMBIO FORZADO POR MONITOR ---
# Hyprland 0.55+ (motor Lua): la sintaxis legacy
# "hyprctl dispatch workspace N" YA NO funciona. Ahora hyprctl dispatch
# recibe una expresión Lua (hl.dsp.*).

# 1. Enfoque explícito en el monitor secundario y cambio de workspace
#    (solo si el monitor está conectado)
if hyprctl monitors | grep -q "^Monitor $MON_SEC"; then
    hyprctl dispatch "hl.dsp.focus({ monitor = \"$MON_SEC\" })" > /dev/null
    hyprctl dispatch "hl.dsp.focus({ workspace = $WS_SEC })" > /dev/null
fi

# 2. Enfoque explícito en el monitor principal y cambio de workspace (mantiene el foco aquí)
hyprctl dispatch "hl.dsp.focus({ monitor = \"$MON_MAIN\" })" > /dev/null
hyprctl dispatch "hl.dsp.focus({ workspace = $WS_MAIN })" > /dev/null
