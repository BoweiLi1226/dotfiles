require("registry.treesitter").register({ "go", "gomod", "gowork", "gosum" })

require("registry.mason").register({
	-- "gopls",
})

vim.lsp.enable("gopls")
