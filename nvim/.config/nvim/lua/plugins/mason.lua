return {
    {
        'mason-org/mason.nvim',
        event = 'VeryLazy',
        depenencies = {
            -- 'mason-org/mason-lspconfig.nvim',
        },
        opts = { },
        config = function(_, opts)
            require('mason').setup(opts)
            local mason_registry = require('mason-registry')

            local function mason_install(package)
                local success, package = pcall(mason_registry.get_package, package)
                if success and not package:is_installed() then
                    package:install()
                end
            end

            packages = {
                'tree-sitter-cli',

                'rust-analyzer',
                'gopls',
                'pyright',
                'lua-language-server',
                'typescript-language-server',
                'lemminx',
                'jdtls',
                'kotlin-lsp',
            }
        end
    },

    {
        'neovim/nvim-lspconfig',
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
