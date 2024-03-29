-- Wipes all registers
vim.api.nvim_create_user_command('WipeReg', function()
	vim.cmd([[ for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor ]])
end, { nargs = 0 })
