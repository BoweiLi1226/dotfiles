return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			auto_integrations = true,
			transparent_background = true,
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			styles = {
				transparency = true,
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		opts = {
			style = "darker",
		},
	},
}
