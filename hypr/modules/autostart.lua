hl.on("hyprland.start", function ()
    hl.dispatch(hl.dsp.exec_cmd("hyprpm reload -n"))
end)
