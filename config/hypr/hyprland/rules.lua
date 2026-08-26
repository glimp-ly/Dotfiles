-- ═══════════════════════════════════════════════════════
-- Convertido de: rules.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- ═══════════════════════════════════════════════════════

local vars = _G.vars or require("variables")

-- ######## Window rules ########
hl.window_rule({ match = { fullscreen = "false" }, opacity = "0.95 override" })

-- They use native transparency or we want them opaque
hl.window_rule({ match = { class = "foot|equibop|org\\.quickshell|imv|swappy" }, opaque = true })
-- Center all floating windows (not xwayland cause popups)
hl.window_rule({ match = { float = "true", xwayland = "false" }, center = true })

-- Float
-- FlafyDev/guifetch
hl.window_rule({ match = { class = "guifetch" }, float = true })
hl.window_rule({ match = { class = "yad" }, float = true })
hl.window_rule({ match = { class = "zenity" }, float = true })
hl.window_rule({ match = { class = "wev" }, float = true })
hl.window_rule({ match = { class = "org\\.gnome\\.FileRoller" }, float = true })
-- WHY IS THERE TWOOOOOOOOOOOOOOOO
hl.window_rule({ match = { class = "file-roller" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "com\\.github\\.GradienceTeam\\.Gradience" }, float = true })
hl.window_rule({ match = { class = "feh" }, float = true })
hl.window_rule({ match = { class = "imv" }, float = true })
hl.window_rule({ match = { class = "system-config-printer" }, float = true })
hl.window_rule({ match = { class = "org\\.quickshell" }, float = true })

-- Float, resize and center
hl.window_rule({ match = { class = "foot", title = "nmtui" }, float = true })
hl.window_rule({ match = { class = "foot", title = "nmtui" }, size = "60% 70%" })
hl.window_rule({ match = { class = "foot", title = "nmtui" }, center = 1 })
hl.window_rule({ match = { class = "org\\.gnome\\.Settings" }, float = true })
hl.window_rule({ match = { class = "org\\.gnome\\.Settings" }, size = "70% 80%" })
hl.window_rule({ match = { class = "org\\.gnome\\.Settings" }, center = 1 })
hl.window_rule({ match = { class = "org\\.pulseaudio\\.pavucontrol|yad-icon-browser" }, float = true })
hl.window_rule({ match = { class = "org\\.pulseaudio\\.pavucontrol|yad-icon-browser" }, size = "60% 70%" })
hl.window_rule({ match = { class = "org\\.pulseaudio\\.pavucontrol|yad-icon-browser" }, center = 1 })
hl.window_rule({ match = { class = "nwg-look" }, float = true })
hl.window_rule({ match = { class = "nwg-look" }, size = "50% 60%" })
hl.window_rule({ match = { class = "nwg-look" }, center = 1 })

-- Special workspaces
hl.window_rule({ match = { class = "btop" }, workspace = "special:sysmon" })
hl.window_rule({ match = { class = "feishin|Spotify|Supersonic|Cider|com.github.th_ch.youtube_music|Plexamp|com-maxrave-simpmusic-MainKt" }, workspace = "special:music" })
-- Spotify wayland, it has no class for some reason
hl.window_rule({ match = { initial_title = "Spotify( Free)?" }, workspace = "special:music" })
hl.window_rule({ match = { class = "discord|equibop|vesktop|whatsapp" }, workspace = "special:communication" })
hl.window_rule({ match = { class = "Todoist" }, workspace = "special:todo" })

-- Dialogs
hl.window_rule({ match = { title = "(Select|Open)( a)? (File|Folder)(s)?" }, float = true })
hl.window_rule({ match = { title = "File (Operation|Upload)( Progress)?" }, float = true })
hl.window_rule({ match = { title = ".* Properties" }, float = true })
hl.window_rule({ match = { title = "Export Image as PNG" }, float = true })
hl.window_rule({ match = { title = "GIMP Crash Debug" }, float = true })
hl.window_rule({ match = { title = "Save As" }, float = true })
hl.window_rule({ match = { title = "Library" }, float = true })

-- Picture in picture (resize and move done via script)
-- Initial move so window doesn't shoot across the screen from the center
hl.window_rule({ match = { title = "Picture(-| )in(-| )[Pp]icture" }, move = "100%-w-2% 100%-w-3%" })
hl.window_rule({ match = { title = "Picture(-| )in(-| )[Pp]icture" }, keep_aspect_ratio = true })
hl.window_rule({ match = { title = "Picture(-| )in(-| )[Pp]icture" }, float = true })
hl.window_rule({ match = { title = "Picture(-| )in(-| )[Pp]icture" }, pin = true })

-- Creative software
hl.window_rule({ match = { class = "krita|gimp|inkscape|darktable|resolve|kdenlive|shotcut|blender|godot" }, opaque = true })

-- Ueberzugpp
hl.window_rule({ match = { class = "^(ueberzugpp_.*)$" }, float = true })
hl.window_rule({ match = { class = "^(ueberzugpp_.*)$" }, no_initial_focus = true })

-- Steam
hl.window_rule({ match = { class = "steam" }, rounding = 10 })
hl.window_rule({ match = { title = "Friends List", class = "steam" }, float = true })

-- Games (Steam, Lutris/Wine, Gamescope)
hl.window_rule({ match = { class = "(steam_app_(default|[0-9]+))|gamescope" }, opaque = true })
-- Allow tearing for games
hl.window_rule({ match = { class = "(steam_app_(default|[0-9]+))|gamescope" }, immediate = true })
-- Always idle inhibit when playing a game
hl.window_rule({ match = { class = "(steam_app_(default|[0-9]+))|gamescope" }, idle_inhibit = "always" })

-- Minecraft launcher consoles
hl.window_rule({ match = { class = "com-atlauncher-App", title = "ATLauncher Console" }, float = true })
hl.window_rule({ match = { class = "PandoraLauncher", title = "Minecraft Game Output" }, float = true })

-- Autodesk Fusion 360
hl.window_rule({ match = { title = "Fusion360|(Marking Menu)", class = "fusion360\\.exe" }, no_blur = true })

-- Ugh xwayland popups
hl.window_rule({ match = { xwayland = "1", title = "win[0-9]+" }, no_dim = true })
hl.window_rule({ match = { xwayland = "1", title = "win[0-9]+" }, no_shadow = true })
hl.window_rule({ match = { xwayland = "1", title = "win[0-9]+" }, rounding = 10 })

-- ######## Workspace rules ########
hl.workspace_rule({ workspace = "w[tv1]s[false]", ["gaps_out"] = 20 })
hl.workspace_rule({ workspace = "f[1]s[false]", ["gaps_out"] = 20 })

-- ######## Layer rules ########
-- Colour picker out animation
hl.layer_rule({ match = { namespace = "hyprpicker" }, animation = "fade" })
-- wlogout
hl.layer_rule({ match = { namespace = "logout_dialog" }, animation = "fade" })
-- slurp
hl.layer_rule({ match = { namespace = "selection" }, animation = "fade" })
hl.layer_rule({ match = { namespace = "wayfreeze" }, animation = "fade" })

-- Fuzzel
hl.layer_rule({ match = { namespace = "launcher" }, animation = "popin 80%" })
hl.layer_rule({ match = { namespace = "launcher" }, blur = true })

-- Launcher (Fuzzel / Rofi)
hl.layer_rule({ match = { namespace = "launcher" }, animation = "popin 80%", blur = true })

-- ═══════════════════════════════════════════════════════
-- LAYER RULES (CAPAS / EWW / SWAYNC / OVERLAYS)
-- ═══════════════════════════════════════════════════════

-- Herramientas del sistema
hl.layer_rule({ match = { namespace = "hyprpicker" }, animation = "fade" })
hl.layer_rule({ match = { namespace = "logout_dialog" }, animation = "fade" })
hl.layer_rule({ match = { namespace = "selection" }, animation = "fade" })
hl.layer_rule({ match = { namespace = "wayfreeze" }, animation = "fade" })

-- Eww (Barra y Widgets)
hl.layer_rule({ match = { namespace = "gtk-layer-shell" }, blur = true })

-- SwayNC (Centro de Notificaciones y Popups)
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true, ignore_alpha = 0 })

-- Rofi (launcher)
hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0 })
