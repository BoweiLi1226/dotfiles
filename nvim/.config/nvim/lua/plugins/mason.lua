return {
    {
        "mason-org/mason.nvim",
        event = 'VeryLazy',
        dependencies = {
            'neovim/nvim-lspconfig',
            'mason-org/mason-lspconfig.nvim',
        },
        opts = {},
        config = function(_, opts)
            require('mason').setup(opts)
            local mason_registry = require('mason-registry')
            local mason_lspconfig = require('mason-lspconfig')

            local function setup(lspPackage, config)
                local success, package = pcall(mason_registry.get_package, lspPackage)
                if success and not package:is_installed() then
                    package:install()
                end

                local nvim_lsp = mason_lspconfig.get_mappings().package_to_lspconfig[lspPackage]
                vim.lsp.config[nvim_lsp] = config
            end

            -- diagnostic
            -- vim.diagnostic.config({
            --     underline = true,
            --     virtual_text = {
            --         spacing = 4,
            --         source = "if_many",
            --         prefix = "●",
            --     },
            --     update_in_insert = false,
            --     severity_sort = true,
            -- })

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local servers = {
                gopls = { capabilities = capabilities },

                pyright = { capabilities = capabilities },

                ['lua-language-server'] = {
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            completion = { callSnippet = "Replace" },
                            workspace = { checkThirdParty = false },
                            codeLens = { enable = true },
                            doc = { privateName = { "^_" } },
                            hint = {
                                enable = true,
                                setType = false,
                                paramType = true,
                                paramName = "Disable",
                                semicolon = "Disable",
                                arrayIndex = "Disable",
                            },
                        },
                    },
                },
            }

            for server, config in pairs(servers) do
                setup(server, config)
            end
        end
    },

    {
        'mfussenegger/nvim-jdtls',
        ft = "java",
        config = function()
            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'java',
                callback = function()
                    require('jdtls').start_or_attach({
                        cmd = require('lspconfig.configs.jdtls').default_config.cmd,
                        root_dir = require('jdtls.setup').find_root({ '.git', 'gradlew', 'mvnw', '.project' }),

                    })
                end,
            })
        end,
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
