function ColorMyPencils(color)
	color = color or "dracula-soft"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
