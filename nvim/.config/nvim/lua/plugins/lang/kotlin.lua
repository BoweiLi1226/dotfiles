-- vim.lsp.enable('kotlin_lsp')

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        optional = true,
        opts = {
            ensure_installed = { 'kotlin' },
        },
        opts_extend = { 'ensure_installed' },
    },

    {
        'mason-org/mason.nvim',
        optional = true,
        opts = {
            ensure_installed = { 'kotlin-lsp' },
        },
        opts_extend = { 'ensure_installed' },
    },
}
