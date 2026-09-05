vim.lsp.enable("lemminx")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = {
			ensure_installed = {
				"xml",
			},
		},
	},

	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				-- "lemminx",
			},
		},
	},
}
