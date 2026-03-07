return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		optional = true,
		opts = {
			ensure_installed = { "rust" },
		},
		opts_extend = { "ensure_installed" },
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				-- "rust-analyzer",
				-- "rustfmt",
				"codelldb",
			},
		},
		opts_extend = { "ensure_installed" },
	},
	{
		"mrcjkb/rustaceanvim",
		lazy = false,
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				rust = { "rustfmt" },
			},
		},
	},
}
