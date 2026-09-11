return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_c = { { "filename", path = 1 } },
			},
		},
	},
	{
		"folke/snacks.nvim",
		optional = true,
		opts = {
			notifier = { enabled = true },
			notify = { enabled = true },
		},
	},
}
