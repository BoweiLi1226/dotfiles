vim.pack.add({
	{
		src = "https://github.com/rose-pine/neovim",
		name = "rose-pine",
	},
})

vim.opt.termguicolors = true
require("rose-pine").setup()
vim.cmd.colorscheme("rose-pine")
