local mod = "SUPER"

local term = "kitty"
local browser = "qutebrowser"

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(term))
hl.bind(mod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mod .. " + Q", hl.dsp.window.close())

--- scrolling binds
hl.bind(mod .. " + H", hl.dsp.layout(('focus l')))
hl.bind(mod .. " + L", hl.dsp.layout(('focus r')))
hl.bind(mod .. " + SHIFT + H", hl.dsp.layout('swapcol l'), { submap_universal = true })
hl.bind(mod .. " + SHIFT + L", hl.dsp.layout('swapcol r'), { submap_universal = true })
hl.bind(mod .. " + R", hl.dsp.layout('colresize +conf'))
hl.bind(mod .. " + F", hl.dsp.layout('colresize 1.0'))
hl.bind(mod .. " + minus", hl.dsp.layout('colresize -0.1'))
hl.bind(mod .. " + equal", hl.dsp.layout('colresize +0.1'))
hl.bind(mod .. " + comma", hl.dsp.layout('consume'))
hl.bind(mod .. " + period", hl.dsp.layout('expel'))
hl.bind(mod .. " + bracketleft", hl.dsp.layout('consume_or_expel prev'))
hl.bind(mod .. " + bracketright", hl.dsp.layout('consume_or_expel next'))
hl.bind(mod .. " + Z", hl.dsp.layout("center"))

hl.bind(mod .. " + O", hl.plugin.scrolloverview.overview('toggle all'))
hl.define_submap("scrolloverview", function ()
    hl.bind("H", hl.plugin.scrolloverview.navigate('left'))
    hl.bind("L", hl.plugin.scrolloverview.navigate('right'))
    hl.bind("K", hl.plugin.scrolloverview.navigate('up'))
    hl.bind("J", hl.plugin.scrolloverview.navigate('down'))
    hl.bind("Q", hl.plugin.scrolloverview.window('close'))
    hl.bind("space", hl.plugin.scrolloverview.overview('off'))
end)

-- Move focus with mainMod + arrow keys
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left"}))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right"}))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up"}))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down"}))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- ("m" instead of "e" so scrolling never jumps to the other monitor's workspaces)
hl.bind(mod .. " + K", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mod .. " + J",   hl.dsp.focus({ workspace = "m-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
