return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
        { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer Local Keymaps (which-key)' },
    },
    opts = {
        spec = {
            { '<leader>c', group = 'code' },
        },
    },
    opts_extend = { 'spec' },
}
