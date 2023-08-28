require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'cssls',
        'pyre',
        'jsonls',
        'yamlls',
        'bashls',
        'ansiblels',
        'dockerls',
        'java_language_server',
        'tailwindcss',
        'terraformls',
        'volar',
        'vimls',
        'rome'
    }
}
