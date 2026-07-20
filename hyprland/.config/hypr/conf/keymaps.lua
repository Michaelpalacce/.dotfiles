-------------------
--- KEYBINDINGS ---
-------------------

-- See https://wiki.hyprland.org/Configuring/Keywords/
local mainMod = "SUPER" -- Sets "Super" key as main modifier

local terminal = "alacritty"
local fileManager = "nautilus"
local menu = "rofi -show drun"
local browser = "brave"
local clipboard = "~/.config/rofi/scripts/clipboard.sh"

-- None - focus shift/control
-- SHIFT - Move actions
-- ALT - Alternative actions, without SUPER
-- CTRL - Submaps/Open Programs

-- Commands and stuff
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Escape", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("hyprworm"))
hl.bind(mainMod .. " + C",
	hl.dsp.exec_cmd(
		'hyprctl --batch "dispatch resizeactive exact 50% 95%; dispatch moveactive 0 5%; dispatch centerwindow 1"'))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("wayscriber --active"))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("$HOME/.local/bin/super-menu"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("$HOME/.local/bin/reload"))
hl.bind(mainMod .. " + T", hl.dsp.window.pseudo()) -- dwindle

-- Gamemode
-- hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("~/.config/hypr/scripts/gamemode.sh"))

-- Open apps and tuis with mainMod and ctrl
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + CTRL + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + CTRL + G", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("slack"))
hl.bind(mainMod .. " + CTRL + D", hl.dsp.exec_cmd("discord"))
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd(fileManager))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

hl.bind(mainMod .. " + l", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind("ALT + l", hl.dsp.exec_cmd("$HOME/.config/rofi/scripts/powermenu.sh"))
hl.bind("ALT + v", hl.dsp.exec_cmd("cliphist list | " .. clipboard .. " | cliphist decode | wl-copy"))
hl.bind("ALT + s", hl.dsp.exec_cmd("$HOME/.local/bin/super-menu show_screenshot_menu"))
hl.bind("ALT + e", hl.dsp.exec_cmd("$HOME/.local/bin/hyprland-emoji"), { description = "Emoji Picker" })

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = "9" }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Move active windows within a workspace
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("mouse:276", hl.dsp.window.drag(), { mouse = true })
hl.bind("mouse:275", hl.dsp.window.resize(), { mouse = true })

-- Smart_split only with mouse, this requires preserve_split = true
hl.bind(mainMod .. " + mouse:272", hl.dsp.exec_cmd("hyprctl keyword dwindle:smart_split 1"), { on_release = false })
hl.bind(mainMod .. " + mouse:272", hl.dsp.exec_cmd("hyprctl keyword dwindle:smart_split 0"), { on_release = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/dunst_ultimate.sh volume_up"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/dunst_ultimate.sh volume_down"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/hypr/scripts/dunst_ultimate.sh volume_mute"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("~/.config/hypr/scripts/dunst_ultimate.sh next_track"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("~/.config/hypr/scripts/dunst_ultimate.sh play_pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("~/.config/hypr/scripts/dunst_ultimate.sh play_pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("~/.config/hypr/scripts/dunst_ultimate.sh prev_track"), { locked = true })

-- Brightness keys don't work
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("~/.config/hypr/scripts/dunst_ultimate.sh brightness_up"))
hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("~/.config/hypr/scripts/dunst_ultimate.sh brightness_down"))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
