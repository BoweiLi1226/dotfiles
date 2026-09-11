require("nvim-treesitter").install({ "python" })

vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",
			},
		},
	},
})

vim.lsp.enable("basedpyright")
