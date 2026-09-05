return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"saghen/blink.lib",
			"rafamadriz/friendly-snippets",
		},
		build = function()
			require("blink.cmp").build():pwait()
		end,
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			cmdline = {
				sources = {
					default = function()
						local cmd_type = vim.fn.getcmdtype()
						if cmd_type == "/" then
							return { "buffer" }
						end
						if cmd_type == ":" then
							return { "cmdline" }
						end
						return {}
					end,
				},
				completion = {
					menu = {
						auto_show = true,
					},
				},
			},
		},
	},
}
