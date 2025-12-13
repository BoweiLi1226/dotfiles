vim.lsp.enable('gopls')

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        optional = true,
        opts = {
            ensure_installed = {
                'go',
                'gomod',
                'gowork',
                'gosum',
            },
        },
        opts_extend = { 'ensure_installed' },
    },
    {
        'mason-org/mason.nvim',
        optional = true,
        opts = {
            ensure_installed = {
                'gopls',
                'delve',
            },
        },
        opts_extend = { 'ensure_installed' },
    },
    {
        'fredrikaverpil/neotest-golang',
        version = '*',
        -- Install gotestsum using go from system
        build = function()
            vim.system({'go', 'install', 'gotest.tools/gotestsum@latest'}):wait()
        end,
    },
    {
        'leoluz/nvim-dap-go',
        opts = {},
    },
}
