vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
})

local icons = require("mini.icons")
icons.setup()

local files = require("mini.files")
files.setup()
vim.keymap.set("n", "-", function()
	files.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open Mini Files (Current Buffer)" })
vim.g.loaded_netrwPlugin = 1

local bufremove = require("mini.bufremove")
bufremove.setup()
vim.keymap.set("n", "<leader>bd", function()
	bufremove.delete(0, false)
end, { desc = "Delete buffer" })

require("mini.snippets").setup()

require("mini.pairs").setup()

require("mini.surround").setup()

require("mini.statusline").setup()
