return {
	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.0.0",
		-- install jsregexp (optional!:).
		build = "make install_jsregexp",
		event = "BufRead",
		config = function()
			require "plugins.lsp.snippets"
		end,
	},
}
