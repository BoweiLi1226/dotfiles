return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        optional = true,
        opts = {
            ensure_installed = { 'rust' },
        },
        opts_extend = { 'ensure_installed' },
    },
    {
        'mason-org/mason.nvim',
        optional = true,
        opts = {
            ensure_installed = { 'rust-analyzer' },
        },
        opts_extend = { 'ensure_installed' },
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^6',
        lazy = false,
    },
}
