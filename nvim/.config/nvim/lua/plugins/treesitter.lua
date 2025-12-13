return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        event = 'VeryLazy',
        opts = {
            ensure_installed = {
                'vim',
                'vimdoc',
            },
        },
        opts_extend = { 'ensure_installed' },
        config = function(_, opts)
            local treesitter = require 'nvim-treesitter'
            treesitter.install(opts.ensure_installed)
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        event = 'VeryLazy',
        opts = {
            select = {
                lookahead = true,
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V', -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                },
                include_surrounding_whitespace = false,
            },
            move = {
                set_jumps = true,
            },
        },
        config = function(_, opts)
            local textobj = require 'nvim-treesitter-textobjects'
            textobj.setup(opts)

            -- select
            local select = require 'nvim-treesitter-textobjects.select'
            vim.keymap.set({ 'x', 'o' }, 'af', function()
                select.select_textobject('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'x', 'o' }, 'if', function()
                select.select_textobject('@function.inner', 'textobjects')
            end)
            vim.keymap.set({ 'x', 'o' }, 'ac', function()
                select.select_textobject('@class.outer', 'textobjects')
            end)
            vim.keymap.set({ 'x', 'o' }, 'ic', function()
                select.select_textobject('@class.inner', 'textobjects')
            end)

            -- move
            local move = require 'nvim-treesitter-textobjects.move'
            vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
                move.goto_next_start('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, ']F', function()
                move.goto_next_end('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
                move.goto_next_start('@class.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, ']C', function()
                move.goto_next_end('@class.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, ']a', function()
                move.goto_next_start('@parameter.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, ']A', function()
                move.goto_next_end('@parameter.outer', 'textobjects')
            end)

            vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
                move.goto_previous_start('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
                move.goto_previous_end('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
                move.goto_previous_start('@class.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[C', function()
                move.goto_previous_end('@class.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[a', function()
                move.goto_previous_start('@parameter.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[A', function()
                move.goto_previous_end('@parameter.outer', 'textobjects')
            end)
        end,
    },

    {
        'mason-org/mason.nvim',
        optional = true,
        opts = {
            ensure_installed = { 'tree-sitter-cli' },
        },
        opts_extend = { 'ensure_installed' },
    },
}
