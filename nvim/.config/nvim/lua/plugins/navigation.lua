vim.pack.add({ "https://github.com/nvim-mini/mini.files", "https://github.com/folke/flash.nvim" })

local files = require("mini.files")

files.setup()

vim.keymap.set("n", "-", files.open, { desc = "Open mini.files" })

vim.g.loaded_netrwPlugin = 1

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
