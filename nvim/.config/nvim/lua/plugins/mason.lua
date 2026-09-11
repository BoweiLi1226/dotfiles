vim.pack.add({ "https://github.com/mason-org/mason.nvim" })

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local tools = {
	-- LSP servers
	-- "basedpyright",
	-- "clangd",
	-- "gopls",
	-- "jdtls",
	-- "kotlin-lsp",
	-- "lemminx",
	-- "lua-language-server",
	-- "marksman",
	-- "neocmakelsp",
	-- "rust-analyzer",
	-- "typescript-language-server",

	-- Formatters
	-- "clang-format",
	-- "gersemi",
	-- "ruff",
	-- "rustfmt",
	-- "stylua",

	-- Treesitter tooling
	-- "tree-sitter-cli",
}

if #tools > 0 then
	local registry = require("mason-registry")

	registry.refresh(function()
		for _, name in ipairs(tools) do
			local package = registry.get_package(name)

			if not package:is_installed() then
				package:install()
			end
		end
	end)
end
