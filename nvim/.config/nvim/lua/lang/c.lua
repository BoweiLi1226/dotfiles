vim.lsp.enable("clangd")
vim.lsp.enable("neocmake")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"cmake",
			},
		},
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				-- "clangd",
				-- "clang-format",
				-- "neocmakelsp",
				-- "gersemi",
			},
		},
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
