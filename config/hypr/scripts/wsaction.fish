#!/usr/bin/env fish

if test "$argv[1]" = '-g'
    set group
    set -e $argv[1]
end

if test (count $argv) -ne 2
    echo 'Wrong number of arguments. Usage: ./wsaction.fish [-g] <dispatcher> <workspace>'
    exit 1
end

set -l active_ws (hyprctl activeworkspace -j | jq -r '.id')

# Hyprland 0.55+ (motor Lua): hyprctl dispatch requiere expresión Lua
# (la sintaxis legacy "hyprctl dispatch workspace N" ya no funciona)
if set -q group
    # Move to group
    set -l ws (math "($argv[2] - 1) * 10 + $active_ws % 10")
    hyprctl dispatch "hl.dsp.focus({ workspace = $ws })"
else
    # Move to ws in group
    set -l ws (math "floor(($active_ws - 1) / 10) * 10 + $argv[2]")
    hyprctl dispatch "hl.dsp.focus({ workspace = $ws })"
end
