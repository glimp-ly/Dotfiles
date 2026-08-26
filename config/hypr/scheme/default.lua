-- ═══════════════════════════════════════════════════════
-- Convertido de: scheme/default.conf
-- Generado por: conf2lua v1.0.0
-- Fecha: 2026-08-15 15:08:05
-- Bridge para esquema de colores por defecto
-- ═══════════════════════════════════════════════════════

local colors = {}
local hypr_dir = os.getenv("HOME") .. "/.config/hypr"
local conf_path = hypr_dir .. "/scheme/default.conf"

local f = io.open(conf_path, "r")
if f then
    for line in f:lines() do
        local name, value = line:match("^%$(%w+)%s*=%s*(.+)$")
        if name and value then
            colors[name] = value:match("^%s*(.-)%s*$")
        end
    end
    f:close()
end

return colors
