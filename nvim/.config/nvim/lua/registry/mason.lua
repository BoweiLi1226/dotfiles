local M = {}

local packages = {}
local finalized = false

function M.register(names)
	assert(not finalized, "Mason configuration has already been finalized")

	for _, name in ipairs(names) do
		packages[name] = true
	end
end

function M.finalize()
	if finalized then
		return
	end

	finalized = true

	local names = vim.tbl_keys(packages)
	if #names == 0 then
		return
	end

	table.sort(names)

	local registry = require("mason-registry")
	registry.refresh(function()
		for _, name in ipairs(names) do
			local package = registry.get_package(name)

			if not package:is_installed() then
				package:install()
			end
		end
	end)
end

return M
