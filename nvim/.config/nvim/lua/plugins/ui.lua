return {
    {
        'nvim-tree/nvim-web-devicons',
        event = 'VeryLazy',
        opts = {},
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = {
            sections = {
                lualine_c = { { 'filename', path = 1 } }
            },
        },
    },
    {
        'akinsho/bufferline.nvim',
        enabled = false,
        version = '*',
        event = 'VeryLazy',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            local bufferline = require 'bufferline'
            bufferline.setup({
                options = {
                    offsets = {
                        {
                            filetype = 'snacks_layout_box',
                            text = 'File Explorer',
                            text_align = 'center',
                        }
                    }
                }
            })
        end,
    },
    {
        'folke/noice.nvim',
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
            'MunifTanjim/nui.nvim',
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            -- 'rcarriga/nvim-notify',
        },
        event = 'VeryLazy',
        opts = {
            -- add any options here
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    -- ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        },
    },
    {
        'norcalli/nvim-colorizer.lua',
        event = "VeryLazy",
    },
    {
        'folke/snacks.nvim',
        optional = true,
        opts = {
            notifier = { enabled = true },
            notify = { enabled = true },
        },
    },
}
