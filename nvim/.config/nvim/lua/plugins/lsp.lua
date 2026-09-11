vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		["_"] = { "trim_whitespace" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cmake = { "gersemi" },
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		rust = { "rustfmt" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	conform.format({ lsp_format = "fallback" })
end, { desc = "Format buffer" })
