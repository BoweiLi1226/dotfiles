-- vim.lsp.enable('kotlin_lsp')

return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = {
			ensure_installed = {
				"kotlin",
			},
		},
	},

	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				-- "kotlin-lsp",
			},
		},
	},
}
