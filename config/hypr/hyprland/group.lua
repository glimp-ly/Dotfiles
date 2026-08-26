-- ═══════════════════════════════════════════════════════
-- Convertido de: group.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- ═══════════════════════════════════════════════════════

local colors = _G.colors or {}
local vars = _G.vars or require("variables")

hl.config({
    group = {
        ["col.border_active"] = vars.activeWindowBorderColour,
        ["col.border_inactive"] = vars.inactiveWindowBorderColour,
        ["col.border_locked_active"] = vars.activeWindowBorderColour,
        ["col.border_locked_inactive"] = vars.inactiveWindowBorderColour,
    },
})


hl.config({
    group = {
        groupbar = {
            font_family = "JetBrains Mono NF",
            font_size = 15,
            gradients = true,
            gradient_round_only_edges = false,
            gradient_rounding = 5,
            height = 25,
            indicator_height = 0,
            gaps_in = 3,
            gaps_out = 3,
        },
    },
})


hl.config({
    group = {
        groupbar = {
            text_color = "rgb(" .. (colors.onPrimary or "000000") .. ")",
            ["col.active"] = "rgba(" .. (colors.primary or "000000") .. "d4" .. ")",
            ["col.inactive"] = "rgba(" .. (colors.outline or "000000") .. "d4" .. ")",
            ["col.locked_active"] = "rgba(" .. (colors.primary or "000000") .. "d4" .. ")",
            ["col.locked_inactive"] = "rgba(" .. (colors.secondary or "000000") .. "d4" .. ")",
        },
    },
})

