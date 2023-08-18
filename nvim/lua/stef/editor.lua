-- Enable Hybrid Line Numbering
vim.wo.relativenumber = true
vim.wo.number = true

-- Configure Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Disable word wrap
vim.opt.wrap = false
-- Whichwrap allows for overflowing to a new line with h and l as well as left and right arrow
vim.opt.whichwrap = '<,>,h,l'

-- Always keep 8 lines of code visible on the bottom and top
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast Updates
vim.opt.updatetime = 50

