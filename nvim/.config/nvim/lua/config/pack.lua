vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(event)
		local data = event.data
		local is_markdown_preview = data.spec.name == "markdown-preview.nvim"
		local needs_build = data.kind == "install" or data.kind == "update"

		if not is_markdown_preview or not needs_build then
			return
		end

		local result = vim.system({ "yarn", "install" }, { cwd = data.path .. "/app" }):wait()

		if result.code ~= 0 then
			local error_message = result.stderr or "unknown error"
			vim.notify("Failed to build markdown-preview.nvim:\n" .. error_message, vim.log.levels.ERROR)
		end
	end,
})
