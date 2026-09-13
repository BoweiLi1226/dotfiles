vim.pack.add({
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
})

local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup({
	snippets = { preset = "mini_snippets" },
	cmdline = {
		completion = { menu = { auto_show = true } },
	},
})
