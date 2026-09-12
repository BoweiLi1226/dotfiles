require("registry.treesitter").register({ "rust" })

require("registry.mason").register({
	-- "rust-analyzer",
	-- "rustfmt",
})

require("registry.conform").register({
	rust = { "rustfmt" },
})

vim.pack.add({ "https://github.com/mrcjkb/rustaceanvim" })
