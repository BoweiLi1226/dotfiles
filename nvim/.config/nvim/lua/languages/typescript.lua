require("registry.treesitter").register({ "typescript" })

require("registry.mason").register({
	-- "tsc"
})

vim.lsp.enable("tsc")
