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
    {
        'nvim-neotest/neotest-python',
    },
    {
        'mfussenegger/nvim-dap-python',
        config = function(_, _)
            require('dap-python').setup(vim.fn.stdpath('data') .. '/mason/packages/debugpy/debugpy-adapter')
        end
    },
}
