-- ═══════════════════════════════════════════════════════
-- Convertido de: keybinds.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- ═══════════════════════════════════════════════════════

local vars = _G.vars or require("variables")

hl.define_submap("global", function()

    -- sirve para abrir kitty, super + k
    hl.bind("SUPER + K", hl.dsp.exec_cmd("kitty"))

    -- hyprlock, bloqueo de pantall
    hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))

    -- menu de aplicaciones
    hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("rofi -show drun"))

    -- menu de aplicaciones
    hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("flameshot gui"))

    -- panel de notificaciones
    hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))

    -- panel de cambio de wallpaper
    hl.bind("SUPER + ALT + W", hl.dsp.exec_cmd("~/.config/rofi/scripts/wallpaper.sh"))

    -- Go to workspace #
    -- $wsaction = ~/.config/hypr/scripts/wsaction.fish
    hl.bind("SUPER + 1", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 1"))
    hl.bind("SUPER + 2", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 2"))
    hl.bind("SUPER + 3", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 3"))
    hl.bind("SUPER + 4", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 4"))
    hl.bind("SUPER + 5", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 5"))
    hl.bind("SUPER + 6", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 6"))
    hl.bind("SUPER + 7", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 7"))
    hl.bind("SUPER + 8", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 8"))
    hl.bind("SUPER + 9", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 9"))
    hl.bind("SUPER + 0", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh 10"))
    -- Go to workspace group #
    -- bind = $kbGoToWsGroup, 1, exec, $wsaction -g workspace 1
    -- bind = $kbGoToWsGroup, 2, exec, $wsaction -g workspace 2
    -- bind = $kbGoToWsGroup, 3, exec, $wsaction -g workspace 3
    -- bind = $kbGoToWsGroup, 4, exec, $wsaction -g workspace 4
    -- bind = $kbGoToWsGroup, 5, exec, $wsaction -g workspace 5
    -- bind = $kbGoToWsGroup, 6, exec, $wsaction -g workspace 6
    -- bind = $kbGoToWsGroup, 7, exec, $wsaction -g workspace 7
    -- bind = $kbGoToWsGroup, 8, exec, $wsaction -g workspace 8
    -- bind = $kbGoToWsGroup, 9, exec, $wsaction -g workspace 9
    -- bind = $kbGoToWsGroup, 0, exec, $wsaction -g workspace 10
    -- Go to workspace -1/+1
    hl.bind("SUPER + mouse_down", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh -1"))
    hl.bind("SUPER + mouse_up", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh +1"))
    hl.bind("CTRL + SUPER + left", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh -1"), { repeating = true })
    hl.bind("CTRL + SUPER + right", hl.dsp.exec_cmd("~/.config/hypr/scripts/sync_ws.sh +1"), { repeating = true })

    -- Go to workspace group -1/+1
    -- bind = Ctrl+Super, mouse_down, workspace, -10
    -- bind = Ctrl+Super, mouse_up, workspace, +10

    -- --- MOVER VENTANAS A WORKSPACES FIJOS (Super + Shift + 1..0) ---
    hl.bind("SUPER + SHIFT + 1", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 1"))
    hl.bind("SUPER + SHIFT + 2", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 2"))
    hl.bind("SUPER + SHIFT + 3", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 3"))
    hl.bind("SUPER + SHIFT + 4", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 4"))
    hl.bind("SUPER + SHIFT + 5", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 5"))
    hl.bind("SUPER + SHIFT + 6", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 6"))
    hl.bind("SUPER + SHIFT + 7", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 7"))
    hl.bind("SUPER + SHIFT + 8", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 8"))
    hl.bind("SUPER + SHIFT + 9", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 9"))
    hl.bind("SUPER + SHIFT + 0", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish 10"))

    -- --- MOVER VENTANAS DE FORMA RELATIVA (Super + Shift + Flechas) ---
    hl.bind("SUPER + SHIFT + right", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish +1"))
    hl.bind("SUPER + SHIFT + left", hl.dsp.exec_cmd("~/.config/hypr/scripts/move_ws.fish -1"))

    -- Move window to workspace #
    -- bind = $kbMoveWinToWs, 1, exec, $wsaction movetoworkspacesilent 1
    -- bind = $kbMoveWinToWs, 2, exec, $wsaction movetoworkspace 2
    -- bind = $kbMoveWinToWs, 3, exec, $wsaction movetoworkspace 3
    -- bind = $kbMoveWinToWs, 4, exec, $wsaction movetoworkspace 4
    -- bind = $kbMoveWinToWs, 5, exec, $wsaction movetoworkspace 5
    -- bind = $kbMoveWinToWs, 6, exec, $wsaction movetoworkspace 6
    -- bind = $kbMoveWinToWs, 7, exec, $wsaction movetoworkspace 7
    -- bind = $kbMoveWinToWs, 8, exec, $wsaction movetoworkspace 8
    -- bind = $kbMoveWinToWs, 9, exec, $wsaction movetoworkspace 9
    -- bind = $kbMoveWinToWs, 0, exec, $wsaction movetoworkspace 10
    -- Move window to workspace group #
    hl.bind("CTRL + SUPER + ALT + 1", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 1"))
    hl.bind("CTRL + SUPER + ALT + 2", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 2"))
    hl.bind("CTRL + SUPER + ALT + 3", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 3"))
    hl.bind("CTRL + SUPER + ALT + 4", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 4"))
    hl.bind("CTRL + SUPER + ALT + 5", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 5"))
    hl.bind("CTRL + SUPER + ALT + 6", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 6"))
    hl.bind("CTRL + SUPER + ALT + 7", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 7"))
    hl.bind("CTRL + SUPER + ALT + 8", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 8"))
    hl.bind("CTRL + SUPER + ALT + 9", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 9"))
    hl.bind("CTRL + SUPER + ALT + 0", hl.dsp.exec_cmd("$wsaction -g movetoworkspace 10"))
    -- Move window to workspace -1/+1
    -- binde = Super+Alt, Page_Up, movetoworkspace, -1
    -- binde = Super+Alt, Page_Down, movetoworkspace, +1
    -- bind = Super+Alt, mouse_down, movetoworkspace, -1
    -- bind = Super+Alt, mouse_up, movetoworkspace, +1
    -- binde = Ctrl+Super+Shift, right, movetoworkspace, +1
    -- binde = Ctrl+Super+Shift, left, movetoworkspace, -1
    -- Move window to/from special workspace
    hl.bind("CTRL + SUPER + SHIFT + up", hl.dsp.window.move({ workspace = "special:special" }))
    hl.bind("CTRL + SUPER + SHIFT + down", hl.dsp.window.move({ workspace = "e+0" }))
    hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special:special" }))

    -- CAMBIAR ENTRE WORKSPACE ESPECIALES

    -- special ws
    hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("special"))
    
    -- music ws
    hl.bind("SUPER + M", hl.dsp.workspace.toggle_special("music"))

    -- Window groups
    hl.bind("ALT + Tab", hl.dsp.window.cycle_next(), { repeating = true })
    hl.bind("SHIFT + ALT + Tab", hl.dsp.window.cycle_next({ next = false }), { repeating = true })
    hl.bind("CTRL + ALT + Tab", hl.dsp.group.next(), { repeating = true })
    hl.bind("CTRL + SHIFT + ALT + Tab", hl.dsp.group.next({ forward = false }), { repeating = true })
    hl.bind("SUPER + Comma", hl.dsp.group.toggle())
    hl.bind("SUPER + U", hl.dsp.window.move({ out_of_group = true }))
    hl.bind("SUPER + SHIFT + Comma", hl.dsp.group.lock_active())

    -- Window actions
    hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
    hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
    hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
    hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
    hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
    hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
    hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
    hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
    hl.bind("SUPER + Minus", function() local w = hl.get_active_window() if w then local s = w.size return hl.dsp.window.resize({ x = -0.1 * s.x, y = 0 * s.y, relative = true }) end end, { repeating = true })  -- Resize left
    hl.bind("SUPER + Equal", function() local w = hl.get_active_window() if w then local s = w.size return hl.dsp.window.resize({ x = 0.1 * s.x, y = 0 * s.y, relative = true }) end end, { repeating = true })  -- Resize right
    hl.bind("SUPER + SHIFT + Minus", function() local w = hl.get_active_window() if w then local s = w.size return hl.dsp.window.resize({ x = 0 * s.x, y = -0.1 * s.y, relative = true }) end end, { repeating = true })  -- Resize up
    hl.bind("SUPER + SHIFT + Equal", function() local w = hl.get_active_window() if w then local s = w.size return hl.dsp.window.resize({ x = 0 * s.x, y = 0.1 * s.y, relative = true }) end end, { repeating = true })  -- Resize down
    hl.bind("SUPER + ALT + left", function() local w = hl.get_active_window() if w then local s = w.size return hl.dsp.window.resize({ x = -0.1 * s.x, y = 0 * s.y, relative = true }) end end, { repeating = true })
    hl.bind("SUPER + ALT + right", function() local w = hl.get_active_window() if w then local s = w.size return hl.dsp.window.resize({ x = 0.1 * s.x, y = 0 * s.y, relative = true }) end end, { repeating = true })
    hl.bind("SUPER + ALT + up", function() local w = hl.get_active_window() if w then local s = w.size return hl.dsp.window.resize({ x = 0 * s.x, y = -0.1 * s.y, relative = true }) end end, { repeating = true })
    hl.bind("SUPER + ALT + down", function() local w = hl.get_active_window() if w then local s = w.size return hl.dsp.window.resize({ x = 0 * s.x, y = 0.1 * s.y, relative = true }) end end, { repeating = true })
    hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind("SUPER + Z", hl.dsp.window.drag(), { mouse = true })
    hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
    hl.bind("SUPER + X", hl.dsp.window.resize(), { mouse = true })
    hl.bind("CTRL + SUPER + Backslash", hl.dsp.window.center())
    hl.bind("CTRL + SUPER + ALT + Backslash", function() local w = hl.get_active_window() if w then local s = w.size return hl.dsp.window.resize({ x = 0.55 * s.x, y = 0.7 * s.y }) end end)
    hl.bind("CTRL + SUPER + ALT + Backslash", hl.dsp.window.center())
    hl.bind("SUPER + P", hl.dsp.window.pin())
    hl.bind("SUPER + F", hl.dsp.window.fullscreen())
    hl.bind("SUPER + ALT + F", hl.dsp.window.fullscreen({ action = "set" }))  -- Fullscreen with borders
    hl.bind("SUPER + ALT + Space", hl.dsp.window.float({ action = "toggle" }))
    hl.bind("SUPER + Q", hl.dsp.window.close())

    -- Apps
    hl.bind("SUPER + T", hl.dsp.exec_cmd("app2unit  -- kitty"))
    hl.bind("SUPER + W", hl.dsp.exec_cmd("flatpak run app.zen_browser.zen"))
    hl.bind("SUPER + C", hl.dsp.exec_cmd("app2unit -- codium"))
    hl.bind("SUPER + G", hl.dsp.exec_cmd("app2unit -- github-desktop"))
    hl.bind("SUPER + E", hl.dsp.exec_cmd("app2unit -- thunar"))
    hl.bind("SUPER + ALT + E", hl.dsp.exec_cmd("app2unit -- nemo"))
    hl.bind("CTRL + ALT + Escape", hl.dsp.exec_cmd("app2unit -- qps"))
    hl.bind("CTRL + ALT + V", hl.dsp.exec_cmd("app2unit -- pavucontrol"))

    -- Utilities
    hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))  -- Colour picker

    -- Volume
    hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
    hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })

    -- Brightness
    hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

    -- Sleep
    hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("systemctl suspend-then-hibernate"), { locked = true })

    -- Clipboard and emoji picker
    hl.bind("CTRL + SHIFT + ALT + V", hl.dsp.exec_cmd("sleep 0.5s && ydotool type -d 1 \"$(cliphist list | head -1 | cliphist decode)\""), { locked = true })  -- Alternate paste

    -- Testing
    hl.bind("SUPER + ALT + f12", hl.dsp.exec_cmd("notify-send -u low -i dialog-information-symbolic 'Test notification' \"Here's a really long message to test truncation and wrapping\\nYou can middle click or flick this notification to dismiss it!\" -a 'Shell' -A \"Test1=I got it!\" -A \"Test2=Another action\""), { locked = true })

end)



-- ─── Activar submap(s) al inicio ───────────────────────
hl.on("hyprland.start", function()
    hl.dispatch(hl.dsp.submap("global"))
end)
