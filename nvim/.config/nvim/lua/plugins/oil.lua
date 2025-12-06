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
}
