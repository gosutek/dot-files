function run --description 'DIY app launcher'
    hyprctl dispatch "hl.dsp.exec_cmd('$argv')"
end
