return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = {
			ensure_installed = {
				"java",
			},
		},
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				-- "jdtls",
			},
		},
	},
	{
		"mfussenegger/nvim-jdtls",
	},
}
