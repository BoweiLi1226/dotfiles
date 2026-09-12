require("registry.treesitter").register({ "typescript" })

require("registry.mason").register({
	-- "typescript-language-server",
})

vim.lsp.enable("ts_ls")
