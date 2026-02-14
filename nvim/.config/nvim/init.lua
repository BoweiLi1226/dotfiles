if vim.g.vscode then
	require("vscode_only.options")
	require("vscode_only.keymaps")
else
	require("config.options")
	require("config.lazy")
	require("config.color-scheme")
	require("config.keymaps")
end
