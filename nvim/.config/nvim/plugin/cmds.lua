-- Wipes all registers
vim.api.nvim_create_user_command('WipeReg', function()
	vim.cmd([[ for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor ]])
end, { nargs = 0 })

vim.api.nvim_create_user_command('DelBuffers', function()
	vim.cmd([[ %bd!|e# ]])
end, { nargs = 0 })

-- load_local_project_config will load a locally stored lua file on demand. Usefull for Project specific settings
local function load_local_project_config()
	local current_dir = vim.fn.getcwd()
	local local_config_file = current_dir .. "/.nvim.lua"

	if vim.fn.filereadable(local_config_file) == 1 then
		local ok, err = pcall(vim.cmd, "source " .. vim.fn.fnameescape(local_config_file))
		if not ok then
			vim.notify("Error sourcing local config file '" .. local_config_file .. "': " .. err, vim.log.levels.ERROR)
		else
			vim.notify("Sourced local config file: " .. local_config_file, vim.log.levels.INFO)
		end
	else
		vim.notify("No .nvim.lua file found in " .. current_dir, vim.log.levels.INFO)
	end
end

vim.api.nvim_create_user_command("ProjectLoad", load_local_project_config, {
	desc = "Load .git/.nvim.lua from the current project directory",
})

local local_config_augroup = vim.api.nvim_create_augroup("LocalConfigManualGroup", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	group = local_config_augroup,
	callback = function()
		load_local_project_config()
	end,
})
