---------------
--- PLUGINS ---
---------------

if hl.plugin and hl.plugin.hyprbars ~= nil then
	hl.config({
		plugin = {
			hyprbars = {
				bar_height = 30,
				bar_color = "rgb(11111b)",
				["col.text"] = "rgb(cdd6f4)",
				bar_text_size = 12,
				bar_text_font = "Jetbrains Mono Nerd Font Mono Bold",
				bar_button_padding = 15,
				bar_padding = 10,
				bar_precedence_over_border = true,
			}
		}
	})

	hl.plugin.hyprbars.add_button({
		bg_color = "rgb(f38ba8)",
		fg_color = "#000000",
		size = 20,
		icon = "",
		action = "hyprctl dispatch 'hl.dsp.window.close()'",
	})

	hl.plugin.hyprbars.add_button({
		bg_color = "rgb(f9e2af)",
		fg_color = "#000000",
		size = 20,
		icon = "",
		action = "hyprctl dispatch 'hl.dsp.window.fullscreen(2)'",
	})

	hl.plugin.hyprbars.add_button({
		bg_color = "rgb(74c7ec)",
		fg_color = "#000000",
		size = 20,
		icon = "",
		action = "hyprctl dispatch 'hl.dsp.window.float({ action = \"toggle\" })'",
	})

	hl.window_rule({
		name = "Hide bars on non-floating windows",
		match = { float = false },
		["hyprbars:no_bar"] = true
	})
end
