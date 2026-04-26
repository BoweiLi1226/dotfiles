return {
	{
		"nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			sections = {
				lualine_c = { { "filename", path = 1 } },
			},
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
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
