return {
	{
		'saghen/blink.cmp',
		lazy = false,
		-- use a release tag to download pre-built binaries
		version = '1.*',
		dependencies = { "archie-judd/blink-cmp-words" },
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				-- set to 'none' to disable the 'default' preset
				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },

				['<C-e>'] = { 'hide', 'fallback' },
				['<Up>'] = { 'hide', 'fallback' },
				['<Down>'] = { 'hide', 'fallback' },

				['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
				['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

				['<Tab>'] = { 'select_next' },
				['<S-Tab>'] = { 'select_prev' },

				['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

				['<CR>'] = { "accept", 'fallback' },


				['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

				['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
				['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
				['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
				['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
				['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
				['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
				['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
				['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
				['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
				['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = 'mono'
			},

			cmdline = {
				-- (optionally) automatically show the menu
				completion = {
					menu = { auto_show = true },
					list = {
						selection = { preselect = false, auto_insert = true }
					},
				},
				keymap = {
					-- optionally, inherit the mappings from the top level `keymap`
					-- instead of using the neovim defaults
					-- preset = 'inherit',

					['<Tab>'] = { 'select_next' },
					['<S-Tab>'] = { 'select_prev' },

					['<C-y>'] = { 'select_and_accept' },
					['<C-e>'] = { 'cancel' },

					['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
					['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
					['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
					['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
					['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
					['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
					['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
					['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
					['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
					['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
				}
			},

			signature = {
				enabled = true,
				window = { border = 'single' }
			},

			completion = {
				ghost_text = { enabled = true },
				-- (Default) Only show the documentation popup when manually triggered
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 50,
					window = { border = 'single' }
				},
				list = {
					selection = { preselect = false, auto_insert = true }
				},
				menu = {
					border = 'single',
					draw = {
						treesitter = { 'lsp' },
						columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
						components = {
							item_idx = {
								text = function(ctx)
									return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or
										tostring(ctx.idx)
								end,
								highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
							},
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								-- Optionally, use the highlight groups from nvim-web-devicons
								-- You can also add the same function for `kind.highlight` if you want to
								-- keep the highlight groups in sync with the icons.
								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							}
						}
					}
				}
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },

				providers = {
					path = {
						opts = {
							get_cwd = function(_)
								return vim.fn.getcwd()
							end,
						},
					},

					-- Use the thesaurus source
					thesaurus = {
						name = "blink-cmp-words",
						module = "blink-cmp-words.thesaurus",
						-- All available options
						opts = {
							-- A score offset applied to returned items.
							-- By default the highest score is 0 (item 1 has a score of -1, item 2 of -2 etc..).
							score_offset = 0,

							-- Default pointers define the lexical relations listed under each definition,
							-- see Pointer Symbols below.
							-- Default is as below ("antonyms", "similar to" and "also see").
							definition_pointers = { "!", "&", "^" },

							-- The pointers that are considered similar words when using the thesaurus,
							-- see Pointer Symbols below.
							-- Default is as below ("similar to", "also see" }
							similarity_pointers = { "&", "^" },

							-- The depth of similar words to recurse when collecting synonyms. 1 is similar words,
							-- 2 is similar words of similar words, etc. Increasing this may slow results.
							similarity_depth = 2,
						},
					},

					-- Use the dictionary source
					dictionary = {
						name = "blink-cmp-words",
						module = "blink-cmp-words.dictionary",
						-- All available options
						opts = {
							-- The number of characters required to trigger completion.
							-- Set this higher if completion is slow, 3 is default.
							dictionary_search_threshold = 3,

							-- See above
							score_offset = 0,

							-- See above
							definition_pointers = { "!", "&", "^" },
						},
					},
				},


				per_filetype = {
					text = { "dictionary" },
					markdown = { "thesaurus", "buffer", "path" },
					gitcommit = { "thesaurus", "buffer", "path" },
				}
			},


			-- Use a preset for snippets, check the snippets documentation for more information
			snippets = { preset = 'luasnip' },

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		}
	}
}
