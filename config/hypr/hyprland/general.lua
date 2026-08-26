-- ═══════════════════════════════════════════════════════
-- Convertido de: general.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- ═══════════════════════════════════════════════════════

local vars = _G.vars or require("variables")

hl.config({
    general = {
        layout = "dwindle",
    },
})


hl.config({
    general = {
        allow_tearing = false,  -- Allows `immediate` window rule to work
    },
})


hl.config({
    general = {
        gaps_workspaces = vars.workspaceGaps,
        gaps_in = vars.windowGapsIn,
        gaps_out = vars.windowGapsOut,
        border_size = vars.windowBorderSize,
    },
})


hl.config({
    general = {
        ["col.active_border"] = vars.activeWindowBorderColour,
        ["col.inactive_border"] = vars.inactiveWindowBorderColour,
    },
})


hl.config({
    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
    },
})

