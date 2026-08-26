#!/usr/bin/env fish

set -l _reload false

# Ensure config directory exists
if ! test -d $argv
    mkdir -p $argv
end

# Ensure hypr-vars.lua exists (Lua format)
if ! test -f $argv/hypr-vars.lua
    echo '-- Variables de Caelestia para Hyprland' > $argv/hypr-vars.lua
    set -l _reload true
end

# Ensure hypr-user.lua exists (Lua format)
if ! test -f $argv/hypr-user.lua
    echo '-- Configuración de usuario de Caelestia' > $argv/hypr-user.lua
    set -l _reload true
end

# Backward compatibility: also create .conf if needed by Caelestia
if ! test -f $argv/hypr-vars.conf
    touch -a $argv/hypr-vars.conf
end

if ! test -f $argv/hypr-user.conf
    touch -a $argv/hypr-user.conf
end

# Reload as needed
if _reload
    hyprctl reload
end
