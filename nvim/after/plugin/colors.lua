function ColorMyPencils(color)
	color = color or "nord"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
