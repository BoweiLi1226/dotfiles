vim.lsp.enable('lemminx')

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        optional = true,
        opts = {
            ensure_installed = { 'xml' },
        },
        opts_extend = { 'ensure_installed' },
    },

    {
        'mason-org/mason.nvim',
        optional = true,
        opts = {
            ensure_installed = { 'lemminx' },
        },
        opts_extend = { 'ensure_installed' },
    },
}
