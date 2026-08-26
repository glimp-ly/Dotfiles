-- Generado automáticamente por Matugen v3
return {
<* for name, value in colors *>
    ["{{ name }}"] = "{{ value.default.hex_stripped }}",
<* endfor *>
    active_border = "rgba({{ colors.primary.default.hex_stripped }}ee)",
    inactive_border = "rgba({{ colors.surface_container.default.hex_stripped }}aa)",
}
