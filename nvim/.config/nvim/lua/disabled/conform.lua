local defaultFormatOpts = { async = false, timeout_ms = 5000, lsp_fallback = true }
return {
	-- Foramtting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<F3>",
				function()
					require("conform").format(defaultFormatOpts)
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				-- javascript = { { "prettierd" } },
				-- typescript = { { "prettierd" } }
			},
			-- Set up format-on-save
			format_on_save = defaultFormatOpts,
			-- Customize formatters
			formatters = {
				-- shfmt = {
				-- 	prepend_args = { "-i", "2" },
				-- },
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
