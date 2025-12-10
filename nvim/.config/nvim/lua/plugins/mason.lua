return {
    {
        'mason-org/mason.nvim',
        event = 'VeryLazy',
        depenencies = {
            -- 'mason-org/mason-lspconfig.nvim',
        },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
        config = function(_, opts)
            local mason = require 'mason'
            mason.setup(opts)

            local mason_registry = require 'mason-registry'

            local function mason_install(package)
                local success, package = pcall(mason_registry.get_package, package)
                if success and not package:is_installed() then
                    package:install()
                end
            end

            local packages_to_install = {
                'tree-sitter-cli',
                'rust-analyzer',

                'gopls',
                'delve',

                'pyright',
                'debugpy',

                'lua-language-server',

                'typescript-language-server',

                'lemminx',

                'jdtls',
                'kotlin-lsp',
            }

            for _, package_to_install in ipairs(packages_to_install) do
                mason_install(package_to_install)
            end
        end
    },

    {
        'neovim/nvim-lspconfig',
        event = 'VeryLazy',
    },

    {
        'mfussenegger/nvim-jdtls',
        event = 'VeryLazy',
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^6',
        lazy = false,
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                "lazy.nvim",
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
