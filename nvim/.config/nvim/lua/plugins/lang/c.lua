vim.lsp.enable("clangd")
vim.lsp.enable("neocmake")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		optional = true,
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"cmake",
			},
		},
		opts_extend = { "ensure_installed" },
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
				"neocmakelsp",
				"gersemi",
			},
		},
		opts_extend = { "ensure_installed" },
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				cmake = { "gersemi" },
			},
		},
	},
}
