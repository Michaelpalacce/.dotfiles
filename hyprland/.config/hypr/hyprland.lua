-- This is a migrated Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Source files from conf/
require("conf.layout")
require("conf.autostart")
require("conf.monitors")
require("conf.keymaps")
require("conf.input")
require("conf.windows_and_worspaces")
require("conf.plugins")
require("conf.submaps")

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
    ecosystem = {
        no_update_news = true
    },
    general = {
        gaps_in = 3,
        gaps_out = 3,
        border_size = 1,
        col = {
            active_border = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 0 },
            inactive_border = "rgba(595959aa)"
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle"
    },
    layout = {
        single_window_aspect_ratio = "4 1.91"
    },
    dwindle = {
        smart_split = false,
        preserve_split = true
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)"
        },
        blur = {
            enabled = false,
            size = 3,
            passes = 1,
            vibrancy = 0.1696
        }
    },
    animations = {
        enabled = true
    },
    master = {
        new_status = "master"
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true
    }
})

local fastest = 1.2
local veryFast = 1.5
local fast = 2
local normal = 3
local normalSlow = 4
local slow = 5
local verySlow = 10

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.animation({ leaf = "global", enabled = true, speed = verySlow, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = verySlow, bezier = "quick" })
hl.animation({ leaf = "border", enabled = true, speed = slow, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = slow, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = normalSlow, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = veryFast, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = veryFast, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = veryFast, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = normal, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = normalSlow, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = normalSlow, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = veryFast, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = fastest, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = veryFast, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = fast, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = fastest, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = fast, bezier = "almostLinear", style = "fade" })
