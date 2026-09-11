require("nvim-treesitter").install({ "markdown", "markdown_inline", "latex", "html", "yaml" })

vim.lsp.enable("marksman")

vim.g.mkdp_filetypes = { "markdown" }

vim.pack.add({ "https://github.com/iamcco/markdown-preview.nvim" })
