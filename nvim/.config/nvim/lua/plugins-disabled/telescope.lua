return {
    'nvim-telescope/telescope.nvim',
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
}
