vim.lsp.enable('clangd')

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        optional = true,
        opts = {
            ensure_installed = {
                'c',
                'cpp',
            },
        },
        opts_extend = { 'ensure_installed' },
    },
    {
        'mason-org/mason.nvim',
        optional = true,
        opts = {
            ensure_installed = {
                'clangd',
            },
        },
        opts_extend = { 'ensure_installed' },
    },
}
