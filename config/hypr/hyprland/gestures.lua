-- ═══════════════════════════════════════════════════════
-- Convertido de: gestures.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- ═══════════════════════════════════════════════════════

local vars = _G.vars or require("variables")

hl.config({
    gestures = {
        workspace_swipe_distance = 700,
        workspace_swipe_cancel_ratio = 0.15,
        workspace_swipe_min_speed_to_force = 5,
        workspace_swipe_direction_lock = true,
        workspace_swipe_direction_lock_threshold = 10,
        workspace_swipe_create_new = true,
    },
})


hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", action = function() hl.dispatch(hl.dsp.workspace.toggle_special("special")) end })
hl.gesture({ fingers = 4, direction = "down", action = function() hl.exec_cmd("systemctl suspend-then-hibernate") end })
