local M = {}

-- require_all is used to load all .lua files in a directory.
-- Will not load subdirectories
function M.require_all(dir)
	local config_dir = vim.fn.stdpath('config')
	local full_dir_path = config_dir .. '/' .. dir

	local files = vim.fn.readdir(full_dir_path)

	if not files then
		vim.notify('Directory not found: ' .. full_dir_path, vim.log.levels.WARN)
		return
	end

	for _, file in ipairs(files) do
		local entry_path = full_dir_path .. '/' .. file

		local stat = vim.loop.fs_stat(entry_path)

		if stat and stat.type == 'directory' then
			goto continue
		end

		if not file:match('%.lua$') then
			goto continue
		end

		local module_name = file:gsub('%.lua$', '')
		local module_path = dir:gsub('lua/', ''):gsub('/', '.') .. '.' .. module_name

		local status, err = pcall(require, module_path)
		if not status then
			vim.notify('Failed to load module: ' .. module_path .. '\n' .. err, vim.log.levels.ERROR)
		end

		::continue::
	end
end

return M
