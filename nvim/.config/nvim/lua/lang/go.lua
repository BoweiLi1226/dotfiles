vim.lsp.enable("gopls")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = {
			ensure_installed = {
				"go",
				"gomod",
				"gowork",
				"gosum",
			},
		},
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				-- "gopls",
			},
		},
	},
}
