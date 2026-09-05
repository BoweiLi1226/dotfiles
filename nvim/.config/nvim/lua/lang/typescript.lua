vim.lsp.enable("ts_ls")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = {
			ensure_installed = {
				"typescript",
			},
		},
	},

	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				-- "typescript-language-server",
			},
		},
	},
}
