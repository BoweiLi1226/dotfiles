local M = {}

local parsers = {}
local finalized = false

function M.register(names)
	assert(not finalized, "Treesitter configuration has already been finalized")

	for _, name in ipairs(names) do
		parsers[name] = true
	end
end

function M.finalize()
	if finalized then
		return
	end

	local names = vim.tbl_keys(parsers)
	table.sort(names)
	require("nvim-treesitter").install(names)

	finalized = true
end

return M
