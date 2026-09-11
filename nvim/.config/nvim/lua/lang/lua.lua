require("nvim-treesitter").install({ "lua" })

vim.pack.add({ "https://github.com/folke/lazydev.nvim" })

require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})

vim.lsp.enable("lua_ls")
