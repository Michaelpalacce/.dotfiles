-----------------
--- AUTOSTART ---
-----------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	hl.exec_cmd("hypridle")                                     -- idle daemon
	hl.exec_cmd("waybar")                                       -- Top bar
	hl.exec_cmd("waycorner")                                    -- Hot corners
	hl.exec_cmd("eww daemon &")
	hl.exec_cmd("dunst")                                        -- Notifications
	hl.exec_cmd("swww-daemon & swww restore")                   -- Restores wallpaper
	hl.exec_cmd("wl-paste --type text --watch cliphist store")  -- Stores only text data
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
	hl.exec_cmd("systemctl --user start hyprpolkitagent")       -- no clue Ref: https://wiki.hypr.land/Hypr-Ecosystem/hyprpolkitagent/
	hl.exec_cmd("hyprpm reload -n")                             -- Load all enabled and installed plugins
	hl.exec_cmd("syncthing")
end)
