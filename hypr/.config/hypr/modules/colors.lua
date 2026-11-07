local ok, generated = pcall(dofile, os.getenv("HOME") .. "/.cache/matugen/hyprland.lua")
if not ok then return else -- silent fail :(

hl.config({
    general = {
        col = {
            active_border = generated.accent,
            inactive_border = generated.muted
        }
    }
})
end
