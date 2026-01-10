return {
    {
        'Theprimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
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
        },
        keys = function()
            local harpoon = require 'harpoon'
            return {
                { '<leader>ha', function() harpoon:list():add() end, desc = 'Add to harpoon list' },
                { '<leader>hl', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'Show harpoon quick menu' },
            }
        end,
    },
    {
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
        end,
    },
    {
        'ibhagwan/fzf-lua',
        enabled = false,
        keys = function()
            local fzf = require 'fzf-lua'
            return {
                -- LSP
                { 'gd', function() fzf.lsp_definitions() end, desc = 'Goto Definitions - fzf' },
                { 'gD', function() fzf.lsp_declarations() end, desc = 'Goto Declarations - fzf' },
                { 'gra', function() fzf.lsp_code_actions() end, desc = 'Code Actions - fzf' },
                { 'gri', function() fzf.lsp_implementations() end, desc = 'Goto Implementation - fzf' },
                { 'grr', function() fzf.lsp_references() end, desc = 'Goto References - fzf' },
                { 'grt', function() fzf.lsp_typedefs() end, desc = 'Goto Type Definitions - fzf' },
                { 'gO', function() fzf.lsp_document_symbols() end, desc = 'Document Symbols - fzf' },
                { '<leader>sS', function() fzf.lsp_live_workspace_symbols() end, desc = 'Live Workspace Symbols - fzf' },
                { '<leader>sd', function() fzf.lsp_document_diagnostics() end, desc = 'Document Diagnostics - fzf' },
                { '<leader>sD', function() fzf.lsp_workspace_diagnostics() end, desc = 'Workspace Diagnostics - fzf' },

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
        'folke/flash.nvim',
        event = 'VeryLazy',
        ---@type Flash.Config
        opts = {
            modes = {
                search = {
                    enabled = true,
                },
                char = {
                    jump_labels = true, },
            },
        },
        keys = {
            { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
            { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
            { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
            { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
            { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
        },
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
    {
        'nvim-telescope/telescope.nvim',
        enabled = false,
        version = false,
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
        },
        keys = {
            -- LSP
            { "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "Goto Definition (Telescope)" },
            { "gr", function() require("telescope.builtin").lsp_references() end, desc = "References (Telescope)" },
            { "gI", function() require("telescope.builtin").lsp_implementations() end, desc = "Goto Implementation (Telescope)" },
            { "gy", function() require("telescope.builtin").lsp_type_definitions() end, desc = "Goto T[y]pe Definition (Telescope)" },
            { "<leader>sS", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, desc = "Dynamic Workspace Symbols (Telescope)" },

            -- search
            { '<leader>s"', function() require("telescope.builtin").registers() end, desc = "Registers (Telescope)" },
            { "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics for buffers (Telescope)" },
            { "<leader>sb", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Search in current buffer (Telescope)" },
            { "<leader>sc", function() require("telescope.builtin").command_history() end, desc = "List command history (Telescope)" },
            { "<leader>sC", function() require("telescope.builtin").commands() end, desc = "List commands (Telescope)" },
            { "<leader>sk", function() require("telescope.builtin").keymaps() end, desc = "List normal mode keymaps (Telescope)" },
            { "<leader>sm", function() require("telescope.builtin").marks() end, desc = "List marks and their value (Telescope)" },

            -- find
            { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files (Telescope)" },
            { "<leader>/", function() require("telescope.builtin").live_grep() end, desc = "Live grep (Telescope)" },
            { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers (Telescope)" },
            { "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Find Recent Files (Telescope)" },
            { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags (Telescope)" },
        },
    },
    {
        'folke/snacks.nvim',
        optional = true,
        ---@type snacks.Config
        opts = {
            explorer = { enabled = false },
            picker = { enabled = true },
        },
        keys = {
            -- Top Pickers & Explorer
            { '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },
            { '<leader>/', function() Snacks.picker.grep() end, desc = 'Grep'},
            -- LSP
            { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
            { 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declarations' },
            { 'gri', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementations' },
            { 'grr', function() Snacks.picker.lsp_references() end, desc = 'Goto References' },
            { 'grt', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto Type Definitions' },
            { 'gO', function() Snacks.picker.lsp_symbols() end, desc = 'Goto LSP Symbols' },
            { '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'Goto LSP workspace symbols' },
            { '<leader>sd', function() Snacks.picker.diagnostics_buffer() end, desc = 'Diagnostics Buffers' },
            { '<leader>sD', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics' },
            -- Files
            { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Find Buffers' },
            { '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
            { '<leader>fp', function() Snacks.picker.projects() end, desc = 'Find Projects' },
            { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Find Recent' },
            -- Search
            { '<leader>s"', function() Snacks.picker.registers() end, desc = 'Registers' },
            { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
            { '<leader>sc', function() Snacks.picker.command_history() end, desc = 'Command History' },
            { '<leader>sC', function() Snacks.picker.commands() end, desc = 'Commands' },
            { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
            { '<leader>sm', function() Snacks.picker.marks() end, desc = 'Marks' },
        },
    },
}
