-- ═══════════════════════════════════════════════════════
-- Convertido de: variables.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- Variables de configuración del usuario
-- ═══════════════════════════════════════════════════════

-- Los colores se cargan desde scheme/current.lua
-- Los keybinds se resuelven inline en keybinds.lua

local colors = _G.colors or {}

local M = {}


-- ─── Aplicaciones ──────────────────────────────────────
M.terminal = "kitty"
M.browser = "flatpak run app.zen_browser.zen"
M.editor = "codium"
M.fileExplorer = "thunar"

-- ─── Configuración general ─────────────────────────────
M.touchpadDisableTyping = true
M.touchpadScrollFactor = 0.3
M.gestureFingers = 3
M.gestureFingersMore = 4
M.mainMod = "SUPER"

-- ─── Estilo visual ─────────────────────────────────────
M.workspaceSwipeFingers = 4
M.blurEnabled = true
M.blurSpecialWs = true
M.blurPopups = true
M.blurInputMethods = true
M.blurSize = 8
M.blurPasses = 3
M.blurXray = false
M.shadowEnabled = true
M.shadowRange = 20
M.shadowRenderPower = 3
M.shadowColour = "rgba(" .. (colors.surface or "000000") .. "d4" .. ")"
M.workspaceGaps = 20
M.windowGapsIn = 5
M.windowGapsOut = 10
M.singleWindowGapsOut = 20
M.windowOpacity = 0.95
M.windowRounding = 15
M.windowBorderSize = 1
M.activeWindowBorderColour = "rgba(" .. (colors.primary or "000000") .. "e6" .. ")"
M.inactiveWindowBorderColour = "rgba(" .. (colors.onSurfaceVariant or "000000") .. "11" .. ")"
M.volumeStep = 10
M.cursorTheme = "sweet-cursors"
M.cursorSize = 24


-- ─── Keybinds (referencia, se resuelven inline) ────────
-- M.kbMoveWinToWs = "Super+Alt"
-- M.kbMoveWinToWsGroup = "Ctrl+Super+Alt"
-- M.kbGoToWs = "Super"
-- M.kbGoToWsGroup = "Ctrl+Super"
-- M.kbNextWs = "Ctrl+Super + right"
-- M.kbPrevWs = "Ctrl+Super + left"
-- M.kbToggleSpecialWs = "Super + S"
-- M.kbWindowGroupCycleNext = "Alt + Tab"
-- M.kbWindowGroupCyclePrev = "Shift+Alt + Tab"
-- M.kbUngroup = "Super + U"
-- M.kbToggleGroup = "Super + Comma"
-- M.kbMoveWindow = "Super + Z"
-- M.kbResizeWindow = "Super + X"
-- M.kbWindowPip = "Super+Alt + Backslash"
-- M.kbPinWindow = "Super + P"
-- M.kbWindowFullscreen = "Super + F"
-- M.kbWindowBorderedFullscreen = "Super+Alt + F"
-- M.kbToggleWindowFloating = "Super+Alt + Space"
-- M.kbCloseWindow = "Super + Q"
-- M.kbSystemMonitor = "Ctrl+Shift + Escape"
-- M.kbMusic = "Super + M"
-- M.kbCommunication = "Super + D"
-- M.kbTodo = "Super + R"
-- M.kbTerminal = "Super + T"
-- M.kbBrowser = "Super + W"
-- M.kbEditor = "Super + C"
-- M.kbFileExplorer = "Super + E"
-- M.kbSession = "Ctrl+Alt + Delete"
-- M.kbShowSidebar = "Super + N"
-- M.kbClearNotifs = "Ctrl+Alt + C"
-- M.kbShowPanels = "Super + K"
-- M.kbLock = "Super + L"
-- M.kbRestoreLock = "Super+Alt + L"

return M
