return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"Theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			{
				"folke/which-key.nvim",
				event = "VeryLazy",
				optional = true,
				opts = {
					spec = {
						{ "<leader>h", group = "harpoon" },
					},
				},
				opts_extend = { "spec" },
			},
		},
		keys = function()
			local harpoon = require("harpoon")
			return {
				{
					"<leader>ha",
					function()
						harpoon:list():add()
					end,
					desc = "Add to harpoon list",
				},
				{
					"<leader>hl",
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "Show harpoon quick menu",
				},
			}
		end,
	},
	{
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		event = "VeryLazy",
		keys = {
			{
				"<leader>-",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
		},
		---@type YaziConfig | {}
		opts = {
			open_for_directories = true,
		},
		init = function()
			vim.g.loaded_netrwPlugin = 1
		end,
	},
	{
		"stevearc/oil.nvim",
		enabled = false,
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			keymaps = {
				["h"] = { "actions.parent", mode = "n" },
				["l"] = { "actions.select" },
			},
			use_default_keymaps = true,
		},
		config = function(_, opts)
			local oil = require("oil")
			oil.setup(opts)
			vim.keymap.set("n", "<leader>-", function()
				vim.cmd("Oil")
			end, { desc = "Open parent directory" })
		end,
	},
	{
		"folke/snacks.nvim",
		optional = true,
		---@type snacks.Config
		opts = {
			explorer = { enabled = false },
			picker = { enabled = true },
		},
		keys = {
			-- Top Pickers & Explorer
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			-- LSP
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declarations",
			},
			{
				"gri",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementations",
			},
			{
				"grr",
				function()
					Snacks.picker.lsp_references()
				end,
				desc = "Goto References",
			},
			{
				"grt",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto Type Definitions",
			},
			{
				"gO",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "Goto LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "Goto LSP workspace symbols",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Diagnostics Buffers",
			},
			{
				"<leader>sD",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			-- Files
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Find Buffers",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Find Projects",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Find Recent",
			},
			-- Search
			{
				'<leader>s"',
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<leader>sa",
				function()
					Snacks.picker.autocmds()
				end,
				desc = "Autocmds",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>sC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		optional = true,
		opts = {
			spec = {
				{ "<leader>f", group = "file" },
				{ "<leader>s", group = "search" },
			},
		},
		opts_extend = { "spec" },
	},
}
