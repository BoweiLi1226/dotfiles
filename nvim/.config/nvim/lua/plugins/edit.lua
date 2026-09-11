vim.pack.add({
	"https://github.com/kylechui/nvim-surround",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/lervag/vimtex",
})

vim.g.vimtex_view_method = "zathura"

require("mini.pairs").setup()
