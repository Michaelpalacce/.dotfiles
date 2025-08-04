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
			local ls = require("luasnip")
			local types = require("luasnip.util.types")
			local snippets = require("lsp.snippets.snippets")

			---#Config
			ls.config.set_config({
				-- Edit the snippet even after I exit it
				history = true,
				-- Update snippet text in _real time_
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
				-- Show virtual text hints for node types
				ext_opts = {
					[types.insertNode] = {
						active = {
							virt_text = { { "●", "Operator" } },
						},
					},
					[types.choiceNode] = {
						active = {
							virt_text = { { "●", "Constant" } },
						},
					},
				},
			})

			-- GO back to the previous region
			vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
			-- Toggle between choices
			vim.keymap.set({ "i", "s" }, "<C-K>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
			-- Go forward to the next region
			vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })

			-- -- load vscode style snippets from other plugins
			-- require("luasnip.loaders.from_vscode").lazy_load()

			-- load my custom snippets
			ls.add_snippets("typescript", snippets.typescript)
			ls.add_snippets("javascript", snippets.javascript)
			ls.add_snippets("go", snippets.go)
		end,
	},
}
