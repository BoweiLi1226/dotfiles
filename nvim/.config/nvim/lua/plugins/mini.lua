vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
})

local files = require("mini.files")
files.setup()
vim.keymap.set("n", "-", function()
	files.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open Mini Files (Current Buffer)" })
vim.g.loaded_netrwPlugin = 1

require("mini.pairs").setup()

require("mini.surround").setup()
