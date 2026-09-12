vim.pack.add({
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
})

local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup({
	snippets = { preset = "mini_snippets" },
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
})
