------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------

hl.window_rule({
    name = "Suppress Maximize All",
    match = { class = ".*" },
    suppress_event = "maximize"
})

hl.window_rule({
    name = "XWayland Drag Fix",
    match = {
        class = "^$",
        xwayland = true
    },
    float = true,
    no_focus = true,
    fullscreen = false,
    pin = false
})

hl.window_rule({
    name = "Float VLC",
    match = { class = "vlc" },
    float = true
})

hl.window_rule({
    name = "Float Waypaper",
    match = { class = "waypaper" },
    float = true
})

hl.window_rule({
    name = "Float Blueman",
    match = { class = "blueman-manager" },
    float = true,
    size = "500px 75%",
    move = "70% 10%"
})

hl.window_rule({
    name = "Float Pavucontrol",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    move = "70% 10%"
})

hl.window_rule({
    name = "Float Informative",
    match = { class = "Informative" },
    float = true,
    size = "75% 90%",
    border_size = 2
})

hl.window_rule({
    name = "Tile Brave",
    match = { class = "Brave-browser" },
    tile = true
})

hl.window_rule({
    name = "Rofi No Anim",
    match = { class = "rofi" },
    no_anim = true
})

hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({
    name = "No Borders on tv1",
    match = { workspace = "w[tv1]", float = false },
    border_size = 0,
    rounding = 0
})

hl.window_rule({
    name = "No Borders on f1",
    match = { workspace = "f[1]", float = false },
    border_size = 0,
    rounding = 0
})
