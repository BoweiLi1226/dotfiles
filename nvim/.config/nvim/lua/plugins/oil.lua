return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        keymaps = {
            ['h'] = { 'actions.parent', mode = 'n' },
            ['l'] = { 'actions.select' }
        },
        use_default_keymaps = true,
    },
    config = function(_, opts)
        local oil = require 'oil'
        oil.setup(opts)
        vim.keymap.set('n', '<leader>e', function() vim.cmd('Oil') end, { desc = 'Open parent directory' })
    end
}
