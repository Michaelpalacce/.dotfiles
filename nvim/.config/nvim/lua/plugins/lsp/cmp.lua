-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local types = require 'cmp.types'

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
		elseif vim.b._copilot_suggestion ~= nil then
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
		else
			fallback()
		end
	end, {
		'i',
		's',
	}),
	['<S-Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end, {
		'i',
		's',
	}),

	-- Documentation
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),

	-- Disable up and down... I want to move
	['<Up>'] = cmp.mapping.close(),
	['<Down>'] = cmp.mapping.close(),
	-- Escape will close the completion menu, but won't cancel insert mode
	['<ESC>'] = cmp.mapping.close(),
}

cmp.setup({
	-- I don't want anything in the completion preview to be highlighted
	preselect = types.cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end
	},
	mapping = mappings,
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua' },
	}, {
		{ name = 'path' },
		{ name = 'buffer' }
	}),
	window = {
		completion = require("stef.helpers.lsp").bordered({
			max_width = 3000,
			max_height = 3000
		}),
		documentation = require("stef.helpers.lsp").bordered({
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
		})
	}
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		{ name = 'path' },
	}, {
		{ name = 'buffer' },
	})
})
require("cmp_git").setup()

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
