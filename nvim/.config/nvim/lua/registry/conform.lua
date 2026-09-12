local M = {}

local formatters_by_ft = {}
local finalized = false

function M.register(entries)
	assert(not finalized, "Conform configuration has already been finalized")

	for filetype, formatters in pairs(entries) do
		assert(formatters_by_ft[filetype] == nil, "Duplicate Conform configuration for " .. filetype)
		formatters_by_ft[filetype] = formatters
	end
end

function M.finalize()
	if finalized then
		return
	end

	require("conform").setup({
		formatters_by_ft = formatters_by_ft,
	})

	finalized = true
end

return M
