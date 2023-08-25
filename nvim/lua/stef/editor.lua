-- Enable Hybrid Line Numbering
vim.wo.relativenumber = true
vim.wo.number = true

-- Configure Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

-- Disable word wrap
vim.opt.wrap = false
-- Whichwrap allows for overflowing to a new line with h and l as well as left and right arrow
vim.opt.whichwrap = '<,>,h,l'

-- Always keep n lines of code visible on the bottom and top
vim.opt.scrolloff = 14
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast Updates
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- vim.opt.cursorline = true -- Enable highlighting of the current line

vim.opt.list = true
-- Set Visible Characters 
vim.opt.listchars = {
  eol = '⤶',
  space = '.',
  tab = '  >',
  trail = '-',
  extends = '>',
  precedes = '<',
}

vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
         ["+"] = "win32yank.exe -i --crlf",
         ["*"] = "win32yank.exe -i --crlf"
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf"
    },
    cache_enabled = false
}
