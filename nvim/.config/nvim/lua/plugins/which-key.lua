vim.pack.add({ "https://github.com/folke/which-key.nvim" })

local which_key = require("which-key")

which_key.setup({
	spec = {
		{ "<leader>c", group = "code" },
		{ "<leader>f", group = "file" },
		{ "<leader>s", group = "search" },
	},
})

vim.keymap.set("n", "<leader>?", function()
	which_key.show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
