vim.pack.add({
	"https://github.com/folke/flash.nvim",
	"https://github.com/ibhagwan/fzf-lua",
})

local flash = require("flash")
flash.setup()

vim.keymap.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set("o", "r", function()
	flash.remote()
end, { desc = "Remote Flash" })

vim.keymap.set({ "o", "x" }, "R", function()
	flash.treesitter_search()
end, { desc = "Treesitter Search" })

vim.keymap.set("c", "<c-s>", function()
	flash.toggle()
end, { desc = "Toggle Flash Search" })

local fzf = require("fzf-lua")
fzf.setup("fzf-native")

-- Top Pickers
vim.keymap.set("n", "<leader>ff", function()
	fzf.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>/", function()
	fzf.live_grep()
end, { desc = "Live Grep" })

-- LSP
vim.keymap.set("n", "gd", function()
	fzf.lsp_definitions()
end, { desc = "Goto Definition" })

vim.keymap.set("n", "gD", function()
	fzf.lsp_declarations()
end, { desc = "Goto Declarations" })

vim.keymap.set("n", "gri", function()
	fzf.lsp_implementations()
end, { desc = "Goto Implementations" })

vim.keymap.set("n", "grr", function()
	fzf.lsp_references()
end, { desc = "Goto References" })

vim.keymap.set("n", "grt", function()
	fzf.lsp_typedefs()
end, { desc = "Goto Type Definitions" })

vim.keymap.set("n", "gO", function()
	fzf.lsp_document_symbols()
end, { desc = "Goto LSP Symbols" })

vim.keymap.set("n", "<leader>sS", function()
	fzf.lsp_live_workspace_symbols()
end, { desc = "Goto LSP workspace symbols" })

vim.keymap.set("n", "<leader>sd", function()
	fzf.diagnostics_document()
end, { desc = "Document Diagnostics" })

vim.keymap.set("n", "<leader>sD", function()
	fzf.diagnostics_workspace()
end, { desc = "Workspace Diagnostics" })

-- Files
vim.keymap.set("n", "<leader>fb", function()
	fzf.buffers()
end, { desc = "Find Buffers" })

vim.keymap.set("n", "<leader>fr", function()
	fzf.oldfiles()
end, { desc = "Find Recent" })

-- Search
vim.keymap.set("n", '<leader>s"', function()
	fzf.registers()
end, { desc = "Registers" })

vim.keymap.set("n", "<leader>sa", function()
	fzf.autocmds()
end, { desc = "Autocmds" })

vim.keymap.set("n", "<leader>sc", function()
	fzf.commands()
end, { desc = "Commands" })

vim.keymap.set("n", "<leader>sC", function()
	fzf.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>sk", function()
	fzf.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>sm", function()
	fzf.marks()
end, { desc = "Marks" })
