return {
    {
        'ibhagwan/fzf-lua',
        keys = function()
            local fzf = require 'fzf-lua'
            return {
                -- LSP
                { 'gd', function() fzf.lsp_definitions() end, desc = 'Goto Definitions' },
                { 'gD', function() fzf.lsp_declarations() end, desc = 'Goto Declarations' },
                { 'gr', function() fzf.lsp_references() end, desc = 'Goto References' },
                { 'gI', function() fzf.lsp_implementations() end, desc = 'Goto Implementation' },
                { 'gy', function() fzf.lsp_typedefs() end, desc = 'Goto Type Definitions' },
                { '<leader>ss', function() fzf.lsp_document_symbols() end, desc = 'Document Symbols' },
                { '<leader>sS', function() fzf.lsp_live_workspace_symbols() end, desc = 'Live Workspace Symbols' },
                { '<leader>sd', function() fzf.lsp_document_diagnostics() end, desc = 'Document Diagnostics' },
                { '<leader>sD', function() fzf.lsp_workspace_diagnostics() end, desc = 'Workspace Diagnostics' },

                -- files
                { '<leader><space>', function() fzf.global() end, desc = 'Global Picker' },
                { '<leader>/', function() fzf.live_grep_native() end, desc = 'Live Grep' },
                { '<leader>ff', function() fzf.files() end, desc = 'Files' },
                { '<leader>fb', function() fzf.buffers() end, desc = 'Buffers' },
                { '<leader>fr', function() fzf.oldfiles() end, desc = 'Recent Files' },
                { '<leader>fh', function() fzf.helptags() end, desc = 'Help Tags' },

                -- search
                { '<leader>s"', function() fzf.registers() end, desc = 'Registers' },
                { '<leader>sa', function() fzf.autocmds() end, desc = 'Autocmds' },
                { '<leader>sc', function() fzf.command_history() end, desc = 'List command history' },
                { '<leader>sC', function() fzf.commands() end, desc = 'List commands' },
                { '<leader>sk', function() fzf.keymaps() end, desc = 'List normal mode keymaps' },
                { '<leader>sm', function() fzf.marks() end, desc = 'List marks and their value' },
            }
        end,
    },
    {

        'folke/which-key.nvim',
        event = 'VeryLazy',
        optional = true,
        opts = {
            spec = {
                { '<leader>f', group = 'file' },
                { '<leader>s', group = 'search' },
            },
        },
        opts_extend = { 'spec' },
    },
}
