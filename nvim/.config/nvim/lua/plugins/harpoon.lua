return {
    {
        'Theprimeagen/harpoon',
        branch = 'harpoon2',
        keys = function()
            local harpoon = require 'harpoon'
            return {
                { '<leader>ha', function() harpoon:list():add() end, desc = 'Add to harpoon list' },
                { '<leader>hl', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Show harpoon quick menu' },
            }
        end,
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        optional = true,
        opts = {
            spec = {
                { '<leader>h', group = 'harpoon' },
            },
        },
        opts_extend = { 'spec' },
    },
}
