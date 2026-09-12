vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

require("registry.conform").register({
	["_"] = { "trim_whitespace" },
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	conform.format({ lsp_format = "fallback" })
end, { desc = "Format buffer" })
