vim.lsp.enable("ty")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		optional = true,
		opts = {
			ensure_installed = {
				"python",
			},
		},
		opts_extend = { "ensure_installed" },
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				-- "ty",
				-- "ruff",
			},
		},
		opts_extend = { "ensure_installed" },
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				python = { "ruff_organize_imports", "ruff_format" },
			},
		},
	},
}
