vim.lsp.enable("basedpyright")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		optional = true,
		opts = {
			ensure_installed = { "python" },
		},
		opts_extend = { "ensure_installed" },
	},
	{
		"mason-org/mason.nvim",
		optional = true,
		opts = {
			ensure_installed = {
				"pyright",
				"basedpyright",
				"debugpy",
				"ruff",
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
	{
		"nvim-neotest/neotest",
		dependencies = { "nvim-neotest/neotest-python" },
		optional = true,
		opts = function(_, opts)
			table.insert(opts.adapters, require("neotest-python")({}))
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function(_, _)
			require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/debugpy-adapter")
		end,
	},
}
