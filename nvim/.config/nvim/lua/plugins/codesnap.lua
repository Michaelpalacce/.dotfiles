return {
	{
		"mistricky/codesnap.nvim",
		build = "make",
		commit = "8d210e272e04528e1205c1606f428575603bbabc",
		config = function()
			require("codesnap").setup({
				mac_window_bar = true,
				title = "CodeSnap.nvim",
				code_font_family = "CaskaydiaCove Nerd Font",
				watermark_font_family = "Pacifico",
				watermark = "",
				bg_theme = "grape",
				breadcrumbs_separator = "/",
				has_breadcrumbs = true,
			})
		end,
	}
}
