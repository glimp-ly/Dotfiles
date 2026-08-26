-- ═══════════════════════════════════════════════════════
-- Convertido de: misc.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- ═══════════════════════════════════════════════════════

local colors = _G.colors or {}

hl.config({
    misc = {
        vrr = 1,
    },
})


hl.config({
    misc = {
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
    },
})


hl.config({
    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
    },
})


hl.config({
    misc = {
        on_focus_under_fullscreen = 2,
        allow_session_lock_restore = true,
        middle_click_paste = false,
        focus_on_activate = true,
        session_lock_xray = true,
    },
})


hl.config({
    misc = {
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
    },
})


hl.config({
    misc = {
        background_color = "rgb(" .. (colors.surfaceContainer or "000000") .. ")",
    },
})


hl.config({
    debug = {
        error_position = 1,
    },
})

