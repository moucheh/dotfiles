--!nonstrict

local function render()
    local opacity = noctalia.getConfig("opacity") or 0.45

    opacity = math.clamp(opacity, 0.0, 0.95)

    -- Convert opacity to an 8-bit alpha channel.
    local alpha = math.floor(opacity * 255 + 0.5)

    local color = string.format("#000000%02X", alpha)

    layer.render(
        ui.column({
            fill = color,
            flexGrow = 1,
        }, {})
    )
end

function update()
    render()
end
