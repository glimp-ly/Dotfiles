-- ═══════════════════════════════════════════════════════
-- Convertido de: hyprland.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- Archivo principal de configuración Hyprland (Lua)
-- ═══════════════════════════════════════════════════════


-- ─── Esquema de colores ────────────────────────────────
-- Colores como tabla Lua pura (sin bridges .conf)
-- Para regenerar después de cambio de wallpaper:
--   conf2lua colors
_G.colors = require("scheme.current")

-- Variables de configuración
_G.vars = require("variables")


-- ─── Variables de usuario (opcional) ───────────────────
pcall(require, "hypr-vars")


-- ─── Monitor por defecto ───────────────────────────────
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1.25 })

-- X11 escalado
-- Desactivar el escalado forzado del compositor para apps X11
hl.config({
    xwayland = {
        force_zero_scaling = true,
        use_nearest_neighbor = false, -- Suavizado si alguna app insiste en escalar
    },
})

-- Variables de entorno para que el cursor y los toolkits no queden desproporcionados
hl.env("XCURSOR_SIZE", "24")
hl.env("GDK_SCALE", "1")

-- ─── Módulos de configuración ──────────────────────────
require("hyprland.env")
require("hyprland.general")
require("hyprland.input")
require("hyprland.misc")
require("hyprland.animations")
require("hyprland.decoration")
require("hyprland.group")
require("hyprland.execs")
require("hyprland.rules")
require("hyprland.gestures")
require("hyprland.keybinds")
require("hyprland.scrolling")
require("hypr-user")


-- ─── Autostart (exec-once) ─────────────────────────────
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon")
end)

hl.on("hyprland.start", function()
    hl.exec_cmd("swaync")
end)

hl.on("hyprland.start", function()
    hl.exec_cmd("eww daemon && eww -c ~/Dotfiles/config/eww/bar open bar")
end)

hl.on("hyprland.start", function()
    hl.exec_cmd("hypridle")
end)
