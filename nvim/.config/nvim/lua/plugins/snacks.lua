vim.pack.add({ "https://github.com/folke/snacks.nvim" })

local snacks = require("snacks")

snacks.setup({
	bigfile = { enabled = true },
	explorer = { enabled = false },
	notifier = { enabled = true },
	notify = { enabled = true },
	picker = { enabled = true },
	profiler = { enabled = true },
	quickfile = { enabled = true },
})

vim.keymap.set("n", "<leader>bd", function()
	snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- Top Pickers
vim.keymap.set("n", "<leader><space>", function()
	snacks.picker.smart()
end, { desc = "Smart Find Files" })

vim.keymap.set("n", "<leader>/", function()
	snacks.picker.grep()
end, { desc = "Grep" })

-- LSP
vim.keymap.set("n", "gd", function()
	snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })

vim.keymap.set("n", "gD", function()
	snacks.picker.lsp_declarations()
end, { desc = "Goto Declarations" })

vim.keymap.set("n", "gri", function()
	snacks.picker.lsp_implementations()
end, { desc = "Goto Implementations" })

vim.keymap.set("n", "grr", function()
	snacks.picker.lsp_references()
end, { desc = "Goto References" })

vim.keymap.set("n", "grt", function()
	snacks.picker.lsp_type_definitions()
end, { desc = "Goto Type Definitions" })

vim.keymap.set("n", "gO", function()
	snacks.picker.lsp_symbols()
end, { desc = "Goto LSP Symbols" })

vim.keymap.set("n", "<leader>sS", function()
	snacks.picker.lsp_workspace_symbols()
end, { desc = "Goto LSP workspace symbols" })

vim.keymap.set("n", "<leader>sd", function()
	snacks.picker.diagnostics_buffer()
end, { desc = "Diagnostics Buffers" })

vim.keymap.set("n", "<leader>sD", function()
	snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

-- Files
vim.keymap.set("n", "<leader>fb", function()
	snacks.picker.buffers()
end, { desc = "Find Buffers" })

vim.keymap.set("n", "<leader>ff", function()
	snacks.picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fp", function()
	snacks.picker.projects()
end, { desc = "Find Projects" })

vim.keymap.set("n", "<leader>fr", function()
	snacks.picker.recent()
end, { desc = "Find Recent" })

-- Search
vim.keymap.set("n", '<leader>s"', function()
	snacks.picker.registers()
end, { desc = "Registers" })

vim.keymap.set("n", "<leader>sa", function()
	snacks.picker.autocmds()
end, { desc = "Autocmds" })

vim.keymap.set("n", "<leader>sc", function()
	snacks.picker.commands()
end, { desc = "Commands" })

vim.keymap.set("n", "<leader>sC", function()
	snacks.picker.command_history()
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>sk", function()
	snacks.picker.keymaps()
end, { desc = "Keymaps" })

vim.keymap.set("n", "<leader>sm", function()
	snacks.picker.marks()
end, { desc = "Marks" })

-- Debug helpers
_G.dd = function(...)
	snacks.debug.inspect(...)
end

_G.bt = function()
	snacks.debug.backtrace()
end

if vim.fn.has("nvim-0.11") == 1 then
	vim._print = function(_, ...)
		_G.dd(...)
	end
else
	vim.print = _G.dd
end

-- Toggles
snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
snacks.toggle.diagnostics():map("<leader>ud")
snacks.toggle.line_number():map("<leader>ul")
snacks.toggle
	.option("conceallevel", {
		off = 0,
		on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
	})
	:map("<leader>uc")
snacks.toggle.treesitter():map("<leader>uT")
snacks.toggle
	.option("background", {
		off = "light",
		on = "dark",
		name = "Dark Background",
	})
	:map("<leader>ub")
snacks.toggle.inlay_hints():map("<leader>uh")
snacks.toggle.indent():map("<leader>ug")
snacks.toggle.dim():map("<leader>uD")
