require("nvim-treesitter").install({ "go", "gomod", "gowork", "gosum" })

vim.lsp.enable("gopls")
