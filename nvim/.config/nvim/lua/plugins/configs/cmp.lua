-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
-- local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end
	},
	mapping = {
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = true }),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- If the completion menu is visible it will navigate to the next item in the list.
		-- If the cursor is on top of a "snippet trigger" it'll expand it.
		-- If the cursor can jump to a snippet placeholder, it moves to it.
		-- If the cursor is in the middle of a word it displays the completion menu
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

		-- Disable up and down... I want to move
		['<Up>'] = cmp.mapping.close(),
		['<Down>'] = cmp.mapping.close(),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua' },
	}, {
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
		dissallow_fuzzy_matching = false
	}
})


cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
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