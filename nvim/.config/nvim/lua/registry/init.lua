local M = {}

function M.finalize()
	require("registry.mason").finalize()
	require("registry.treesitter").finalize()
	require("registry.conform").finalize()
end

return M
