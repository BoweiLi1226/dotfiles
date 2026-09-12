require("registry.treesitter").register({ "python" })

require("registry.mason").register({
	-- "basedpyright",
	-- "ruff",
})

require("registry.conform").register({
	python = { "ruff_organize_imports", "ruff_format" },
})

vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",
			},
		},
	},
})

vim.lsp.enable("basedpyright")
