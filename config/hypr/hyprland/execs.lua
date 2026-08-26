-- ═══════════════════════════════════════════════════════
-- Convertido de: execs.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- ═══════════════════════════════════════════════════════

local vars = _G.vars or require("variables")

-- Keyring and auth

-- Clipboard history

-- Auto delete trash 30 days old

-- Cursors

-- Location provider and night light

-- Forward bluetooth media commands to MPRIS

-- Resize and move windows based on matches (e.g. pip)

-- Start shell

-- ─── Autostart (exec-once) ─────────────────────────────
hl.on("hyprland.start", function()
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("trash-empty 30")
    hl.exec_cmd("hyprctl setcursor $cursorTheme $cursorSize")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme '$cursorTheme'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size $cursorSize")
    hl.exec_cmd("/usr/lib/geoclue-2.0/demos/agent")
    hl.exec_cmd("sleep 1 && gammastep")
    hl.exec_cmd("mpris-proxy")
end)
