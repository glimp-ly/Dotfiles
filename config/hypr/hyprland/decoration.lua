-- ═══════════════════════════════════════════════════════
-- Convertido de: decoration.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- ═══════════════════════════════════════════════════════

local vars = _G.vars or require("variables")

hl.config({
    decoration = {
        rounding = vars.windowRounding,
    },
})


hl.config({
    decoration = {
        blur = {
            enabled = vars.blurEnabled,
            xray = vars.blurXray,
            special = vars.blurSpecialWs,
            ignore_opacity = true,  -- Allows opacity blurring
            new_optimizations = true,
            popups = vars.blurPopups,
            input_methods = vars.blurInputMethods,
            size = vars.blurSize,
            passes = vars.blurPasses,
        },
    },
})


hl.config({
    decoration = {
        shadow = {
            enabled = vars.shadowEnabled,
            range = vars.shadowRange,
            render_power = vars.shadowRenderPower,
            color = vars.shadowColour,
        },
    },
})

