require("registry.treesitter").register({ "markdown", "markdown_inline", "latex", "html", "yaml" })

require("registry.mason").register({
	-- "marksman",
})

vim.lsp.enable("marksman")

vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim" })
