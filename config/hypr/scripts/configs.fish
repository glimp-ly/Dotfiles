#!/usr/bin/env fish

set -l _reload false

# Ensure config directory exists
if ! test -d $argv
    mkdir -p $argv
end

# Ensure hypr-vars.lua exists (Lua format)
if ! test -f $argv/hypr-vars.lua
    echo '-- Variables de usuario para Hyprland' > $argv/hypr-vars.lua
    set -l _reload true
end

# Ensure hypr-user.lua exists (Lua format)
if ! test -f $argv/hypr-user.lua
    echo '-- Configuración de usuario de Hyprland' > $argv/hypr-user.lua
    set -l _reload true
end

# Reload as needed
if $_reload
    hyprctl reload
end
