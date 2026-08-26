-- ═══════════════════════════════════════════════════════
-- Convertido de: input.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- ═══════════════════════════════════════════════════════

local vars = _G.vars or require("variables")

hl.config({
    input = {
        kb_layout = "latam",
        numlock_by_default = false,
        repeat_delay = 250,
        repeat_rate = 35,
    },
})


hl.config({
    input = {
        focus_on_close = 1,
    },
})


hl.config({
    input = {
        touchpad = {
            natural_scroll = true,
            disable_while_typing = vars.touchpadDisableTyping,
            scroll_factor = vars.touchpadScrollFactor,
        },
    },
})


hl.config({
    binds = {
        scroll_event_delay = 0,
    },
})


hl.config({
    cursor = {
        hotspot_padding = 1,
    },
})


