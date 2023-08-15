local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',
	'lua_ls',
	'clangd',
	'cssls',
	'denols',
	'pyre'
})



lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybinding:s
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- If the completion menu is visible it will navigate to the next item in the list. 
    -- If the cursor is on top of a "snippet trigger" it'll expand it. 
    -- If the cursor can jump to a snippet placeholder, it moves to it. 
    -- If the cursor is in the middle of a word it displays the completion menu
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }
})

-- Make sure you setup `cmp` after lsp-zero

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})

