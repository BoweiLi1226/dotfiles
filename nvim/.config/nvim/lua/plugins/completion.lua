return {
    {
        'saghen/blink.cmp',
        version = '*',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        event = 'VeryLazy',
        opts = {
            completion = {
                documentation = {
                    auto_show = true,
                    window = {
                        border = 'rounded',
                    },
                },
                menu = {
                    border = 'rounded',
                    draw = {
                        columns = {
                            { 'label', 'label_description', gap = 1 },
                            { 'kind_icon', 'kind' },
                        },
                    },
                }
            },
            keymap = {
                preset = 'super-tab',
            },
            sources = {
                default = { 'path', 'snippets', 'buffer', 'lsp' },
            },

            -- cmd line
            cmdline = {
                sources = function ()
                    local cmd_type = vim.fn.getcmdtype()
                    if cmd_type == '/' then
                        return { 'buffer' }
                    end
                    if cmd_type == ':' then
                        return { 'cmdline' }
                    end
                    return {}
                end,
                keymap = {
                    preset = 'super-tab',
                },
                completion = {
                    menu = {
                        auto_show = true,
                    },
                },
            },
        },
    },
    {
        'hrsh7th/nvim-cmp',
        enabled = false,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',

            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        opts = function()
            local cmp = require 'cmp'
            return {
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                        -- vim.snippet.expand(args.body) --native neovim snippets
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. 
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'lazydev', group_index = 0 },
                }, {
                    { name = 'buffer' },
                }),
            }
        end,
    },
}
