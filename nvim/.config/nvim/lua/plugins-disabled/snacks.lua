return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        explorer = { enabled = true },
        picker = { enabled = true },
        statuscolumn = { enabled = true },
        indent = { enabled = true },
        notifier = { enabled = true },
        scroll = { enabled = true },
        words = { enabled = true },
        input = { enabled = true },
        scope = { enabled = true },
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep"},
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
        -- Find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
        { "<leader>fB", function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = "Find Buffers (all)" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Find Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find Recent" },
        -- Search
        { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Diagnostics Buffers" },
        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declarations" },
        { "gr", function() Snacks.picker.lsp_references() end, desc = "Goto References" },
        { "gD", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementations" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definitions" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "Goto LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Goto LSP workspace symbols" },
        -- Other
        { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
        { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
        { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },
        { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference" },
        { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Next Reference" },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd
                -- Create some toggle mappings
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.treesitter():map("<leader>uT")
            end,
        })
    end
}
