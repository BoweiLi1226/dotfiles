vim.lsp.enable('pyright')

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        optional = true,
        opts = {
            ensure_installed = { 'python' },
        },
        opts_extend = { 'ensure_installed' },
    },

    {
        'mason-org/mason.nvim',
        optional = true,
        opts = {
            ensure_installed = {
                'pyright',
                'debugpy',
            },
        },
        opts_extend = { 'ensure_installed' },
    },
}
