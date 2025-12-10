return {
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
}
