require('lualine').setup {
	options = { theme = 'auto' },
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'hostname', 'filename', 'progress' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	}
}
--
-- require("lualine").setup({
-- 	sections = {
-- 		lualine_x = {
-- 			{
-- 				require("lazy.status").updates,
-- 				cond = require("lazy.status").has_updates,
-- 				color = { fg = "#ff9e64" },
-- 			},
-- 		},
-- 	},
-- })
