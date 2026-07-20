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
				["hyprbars-button"] = {
					"rgb(f38ba8), 20, , hyprctl dispatch killactive",
					"rgb(f9e2af), 20, , hyprctl dispatch fullscreen 2",
					"rgb(74c7ec), 20, , hyprctl dispatch hl.dsp.window.float({action='toggle'})"
				}
			}
		}
	})
end
