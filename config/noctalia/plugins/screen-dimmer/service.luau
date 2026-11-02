--!nonstrict
-- Headless service that owns the dimmer on/off state.
--
-- Trigger it from niri (or any shell) with:
--   noctalia msg plugin local/screen-dimmer:service all toggle
--
-- Events: toggle | on | off (show/hide are aliases)

local function isEnabled()
    return noctalia.state.get("enabled") == true
end

local function apply()
    if isEnabled() then
        noctalia.layer.show("dimmer")
    else
        noctalia.layer.hide("dimmer")
    end
end

-- Reflect the last known state (also correct across hot reloads).
apply()
noctalia.state.watch("enabled", apply)

function onIpc(event, payload)
    if event == "toggle" then
        noctalia.state.set("enabled", not isEnabled())
    elseif event == "on" or event == "show" then
        noctalia.state.set("enabled", true)
    elseif event == "off" or event == "hide" then
        noctalia.state.set("enabled", false)
    end
end
