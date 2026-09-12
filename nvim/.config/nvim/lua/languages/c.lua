require("registry.treesitter").register({ "c", "cpp", "cmake" })

require("registry.mason").register({
	-- "clangd",
	-- "clang-format",
	-- "neocmakelsp",
	-- "gersemi",
})

require("registry.conform").register({
	c = { "clang-format" },
	cpp = { "clang-format" },
	cmake = { "gersemi" },
})

vim.lsp.enable("clangd")
vim.lsp.enable("neocmake")
