-- Wipes all registers
vim.api.nvim_create_user_command('WipeReg', function()
	vim.cmd([[ for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor ]])
end, { nargs = 0 })

vim.api.nvim_create_user_command('DelBuffers', function()
	vim.cmd([[ %bd!|e# ]])
end, { nargs = 0 })
