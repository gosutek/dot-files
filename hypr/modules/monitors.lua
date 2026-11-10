local small_monitor = "HDMI-A-1"
local wide_monitor  = "DP-3"

hl.monitor({
    output   = small_monitor,
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = wide_monitor,
    mode     = "3440x1440@164.90",
    position = "1920x0",
    scale    = 1,
})

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

hl.config({
    cursor = {
        default_monitor = wide_monitor
    },
})

for i = 1, 10 do
    local on_wide = i <= 5
    hl.workspace_rule({
        workspace  = tostring(i),
        monitor    = on_wide and wide_monitor or small_monitor,
        default    = (i == 1 or i == 6),
        persistent = true,
    })
end

