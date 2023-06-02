require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "c", "rust", "vue", "vim", "javascript", "typescript", "php", "html", "cpp", "css" },
    context_commentstring = {enable = true},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    indent = { enable = false },
}
