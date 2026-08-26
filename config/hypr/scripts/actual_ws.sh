# Obtener workspace activo actual
ACTIVE_WS=$(hyprctl activeworkspace -j | jq '.id')

echo $ACTIVE_WS
