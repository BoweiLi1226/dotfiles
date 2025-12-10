return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
        { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer Local Keymaps (which-key)' },
    },
    config = function()
        local wk = require 'which-key'
        wk.add({
            { '<leader>f', group = 'file' },
            { '<leader>s', group = 'search' },
            { '<leader>t', group = 'test' },
            { '<leader>d', group = 'debug' },
            { '<leader>c', group = 'code' },
        })
    end
}

