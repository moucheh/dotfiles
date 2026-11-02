--!nonstrict

local function updateShortcut()
    local enabled = noctalia.state.get("enabled") == true

    shortcut.setLabel("Dimmer")
    shortcut.setIcon("moon")
    shortcut.setActive(enabled)
end

updateShortcut()
noctalia.state.watch("enabled", updateShortcut)

function onClick()
    local enabled = noctalia.state.get("enabled") == true

    -- The service owns the layer; the shortcut only flips shared state.
    noctalia.state.set("enabled", not enabled)
end
