return {
    'ibhagwan/fzf-lua',
    keys = {
        -- LSP
        { 'gd', function() require('fzf-lua').lsp_definitions() end, desc = 'Goto Definitions' },
        { 'gD', function() require('fzf-lua').lsp_declarations() end, desc = 'Goto Declarations' },
        { 'gr', function() require('fzf-lua').lsp_references() end, desc = 'Goto References' },
        { 'gI', function() require('fzf-lua').lsp_implementations() end, desc = 'Goto Implementation' },
        { 'gy', function() require('fzf-lua').lsp_typedefs() end, desc = 'Goto Type Definitions' },
        { '<leader>ss', function() require('fzf-lua').lsp_document_symbols() end, desc = 'Document Symbols' },
        { '<leader>sS', function() require('fzf-lua').lsp_live_workspace_symbols() end, desc = 'Live Workspace Symbols' },
        { '<leader>sd', function() require('fzf-lua').lsp_document_diagnostics() end, desc = 'Document Diagnostics' },
        { '<leader>sD', function() require('fzf-lua').lsp_workspace_diagnostics() end, desc = 'Workspace Diagnostics' },

        -- files
        { '<leader><space>', function() require('fzf-lua').global() end, desc = 'Global Picker' },
        { '<leader>/', function() require('fzf-lua').live_grep_native() end, desc = 'Live Grep' },
        { '<leader>ff', function() require('fzf-lua').files() end, desc = 'Files' },
        { '<leader>fb', function() require('fzf-lua').buffers() end, desc = 'Buffers' },
        { '<leader>fr', function() require('fzf-lua').oldfiles() end, desc = 'Recent Files' },
        { '<leader>fh', function() require('fzf-lua').helptags() end, desc = 'Help Tags' },

        -- search
        { '<leader>s"', function() require('fzf-lua').registers() end, desc = 'Registers' },
        { '<leader>sa', function() require('fzf-lua').autocmds() end, desc = 'Autocmds' },
        { '<leader>sc', function() require('fzf-lua').command_history() end, desc = 'List command history' },
        { '<leader>sC', function() require('fzf-lua').commands() end, desc = 'List commands' },
        { '<leader>sk', function() require('fzf-lua').keymaps() end, desc = 'List normal mode keymaps' },
        { '<leader>sm', function() require('fzf-lua').marks() end, desc = 'List marks and their value' },
    },
}
