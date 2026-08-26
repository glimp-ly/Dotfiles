#!/usr/bin/env fish

# Requisito: jq instalado
set active_mon (hyprctl activeworkspace -j | jq -r '.monitor')
set active_ws (hyprctl activeworkspace -j | jq '.id')

# Obtener posición base (1..10)
set current_key 1
if test $active_ws -gt 10 -a $active_ws -le 20
    set current_key (math "$active_ws - 10")
else if test $active_ws -ge 1 -a $active_ws -le 10
    set current_key $active_ws
end

set target_key $argv[1]

# Soporte para movimiento relativo (+1 / -1)
if test "$argv[1]" = "+1"
    set target_key (math "($current_key % 10) + 1")
else if test "$argv[1]" = "-1"
    set target_key (math "(($current_key - 2 + 10) % 10) + 1")
end

# Si la ventana está en la pantalla HDMI, enviar a su equivalente 11..20
if test "$active_mon" = "HDMI-A-1"
    set dest_ws (math "$target_key + 10")
else
    set dest_ws $target_key
end

# Mover la ventana enfocada al workspace calculado
# Hyprland 0.55+ (motor Lua): hyprctl dispatch requiere expresión Lua
hyprctl dispatch "hl.dsp.window.move({ workspace = $dest_ws })"
