local terminal = "alacritty"
local browser = "brave"

hl.on("hyprland.start", function()
    hl.exec_cmd("[workspace 1 silent] " .. browser)
    hl.exec_cmd("[workspace 2 silent] " .. terminal)
end)
