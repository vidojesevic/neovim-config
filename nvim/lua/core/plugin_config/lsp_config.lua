require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls", "clangd", "omnisharp", "cssls", "cssmodules_ls", "jsonls", "html", "quick_lint_js", "tsserver", "intelephense", "sqlls", "rust_analyzer", "vuels" }
})

local on_attach = function(_, _)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end


require('lspconfig').tsserver.setup{
    on_attach = on_attach,
    flags = lsp_flags
}

require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'lsp_flags' }
            }
        }
    }
}

require('lspconfig').intelephense.setup({
    settings = {
        intelephense = {
            stubs = {
                "bcmath",
                "bz2",
                "calendar",
                "Core",
                "curl",
                "zip",
                "zlib",
                "wordpress",
                "woocommerce",
                "acf-pro",
                "wordpress-globals",
                "wp-cli",
                "genesis",
                "polylang"
            },
            environment = {
              includePaths = '/home/your-user/.composer/vendor/php-stubs/' -- this line forces the composer path for the stubs in case inteliphense don't find it...
            },
            files = {
                maxSize = 5000000;
            }
        }
    }
})
 
require('lspconfig').clangd.setup{}

local servers = {'tsserver', 'lua_ls', 'inteliphense'}


