-- You need to setup `cmp` after lsp
local cmp = require('cmp')
local types = require 'cmp.types'

-- Options
-- Set the number of lines to show in the popup menu
vim.opt.pumheight = 10

-- Rest

local mappings = {
	-- `Enter` to confirm completion
	-- In most cases, tab will be enough to confirm completion
	['<CR>'] = cmp.mapping.confirm({ select = false }),

	-- Ctrl+Space to trigger completion menu
	['<C-Space>'] = cmp.mapping.complete(),

	-- If the completion menu is visible it will navigate to the next item in the list.
	-- If the cursor is in the middle of a word it displays the completion menu
	-- If the completion menu is not visible, accept copilot suggestion if available
	['<Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
			-- elseif require("copilot.suggestion").is_visible() then
			-- 	require("copilot.suggestion").accept()
		else
			fallback()
		end
	end, { 'i', 's' }),
	['<C-Y>'] = cmp.mapping(function(fallback)
		-- if require("copilot.suggestion").is_visible() then
		-- 	require("copilot.suggestion").accept()
		-- else
		fallback()
		-- end
	end, { 'i', 'v', 'n', 's' }),
	['<S-Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end, { 'i', 's' }),

	-- Documentation
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),

	-- Disable up and down... I want to move around if I press them
	['<Up>'] = function(fallback)
		if cmp.visible() then
			cmp.close()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Up>', true, true, true), 'n', true)
		else
			fallback()
		end
	end,
	['<Down>'] = function(fallback)
		if cmp.visible() then
			cmp.close()
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Down>', true, true, true), 'n', true)
		else
			fallback()
		end
	end,
	-- Escape will close the completion menu, but won't cancel insert mode
	['<ESC>'] = cmp.mapping.close(),
}

cmp.setup({
	-- I don't want anything in the completion preview to be highlighted/Preselected
	-- Preselected means that the first item in the completion menu is selected by default
	-- so pressing `Enter` will confirm the completion
	preselect = types.cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end
	},
	mapping = mappings,
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', group_index = 5 },
		{ name = 'luasnip',  group_index = 5 },
	}, {
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'path' },
		{ name = 'buffer',                 max_item_count = 5 }
	}),
	window = {
		completion = require("plugins.lsp.helpers.bordered").bordered({
			max_width = 3000,
			max_height = 3000
		}),
		documentation = require("plugins.lsp.helpers.bordered").bordered({
			max_width = 3000,
			max_height = 3000
		}),
	},
	matching = {
		-- I want to do fuzzy matching :)
		dissallow_fuzzy_matching = false
	},
	formatting = {
		fields = { 'abbr', 'kind', 'menu' },
		format = require('lspkind').cmp_format({
			mode = 'symbol_text', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters
			ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
			symbol_map = { Copilot = "" }
		})
	}
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'buffer' },
	})
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{
			name = 'cmdline',
			option = {
				ignore_cmds = { 'Man', '!' }
			}
		}
	})
})
