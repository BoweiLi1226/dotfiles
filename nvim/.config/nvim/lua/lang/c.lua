require("nvim-treesitter").install({ "c", "cpp", "cmake" })

vim.lsp.enable("clangd")
vim.lsp.enable("neocmake")
