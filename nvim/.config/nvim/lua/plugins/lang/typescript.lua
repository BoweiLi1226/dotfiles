vim.lsp.enable('ts_ls')

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        optional = true,
        opts = {
            ensure_installed = { 'typescript' },
        },
        opts_extend = { 'ensure_installed' },
    },

    {
        'mason-org/mason.nvim',
        optional = true,
        opts = {
            ensure_installed = { 'typescript-language-server' },
        },
        opts_extend = { 'ensure_installed' },
    },
}
