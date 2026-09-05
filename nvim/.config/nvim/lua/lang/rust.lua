return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = {
			ensure_installed = {
				"rust",
			},
		},
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				-- "rust-analyzer",
				-- "rustfmt",
			},
		},
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
