return {
    'Theprimeagen/harpoon',
    branch = 'harpoon2',
    opts = {},
    config = function(_, opts)
        local harpoon = require('harpoon')
        vim.keymap.set('n', '<leader>h', function() harpoon:list():add() end, { desc = 'Add to harpoon list' })
        vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Show harpoon quick menu' })
    end
}
