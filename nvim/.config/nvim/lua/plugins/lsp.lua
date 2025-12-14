return {
    {
        'mason-org/mason.nvim',
        event = 'VeryLazy',
        opts = {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
            ensure_installed = {},
        },
        opts_extend = { 'ensure_installed' },
        config = function(_, opts)
            local mason = require 'mason'
            mason.setup(opts)
            local mr = require 'mason-registry'

            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end

            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },
    {
        'neovim/nvim-lspconfig',
        event = 'VeryLazy',
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        optional = true,
        opts = {
            spec = {
                { '<leader>c', group = 'code' },
            },
        },
        opts_extend = { 'spec' },
    },
}
