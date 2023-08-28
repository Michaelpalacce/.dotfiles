require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'pyre',
        'jsonls',
        'yamlls',
        'java_language_server',
        'vimls',
        -- 'rome'
    }
}
