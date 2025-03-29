-- Allows me to see the currently active LSP clients in the status bar
-- Taken from: https://stackoverflow.com/questions/76518562/looking-for-current-buffer-lsp-clients-in-lualin
local clients_lsp = function()
	local bufnr = vim.api.nvim_get_current_buf()

	local clients = vim.lsp.get_clients(bufnr)
	if next(clients) == nil then
		return ''
	end

	local c = {}
	for _, client in pairs(clients) do
		table.insert(c, client.name)
	end
	return '\u{f085}  LSP: ' .. table.concat(c, ',')
end

local lint_progress = function()
	local linters = require("lint").get_running()
	if #linters == 0 then
		return "󰦕"
	end
	return "󱉶 " .. table.concat(linters, ", ")
end

return {
	{
		'nvim-lualine/lualine.nvim', -- Provides a nice status bar at the bottom of the screen
		dependencies = {
			-- 'AndreM222/copilot-lualine'
		},
		opts = {
			options = {
				theme = "catppuccin",
				icons_enabled = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { { 'filename', path = 1, shorting_target = 60 } },
				lualine_x = {
					clients_lsp,
					-- {
					-- 	'copilot',
					-- 	show_colors = true
					-- },
				},
				lualine_y = { lint_progress },
				lualine_z = { 'filetype' }
			}
		}
	},
}
