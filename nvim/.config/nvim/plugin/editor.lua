vim.wo.relativenumber = true
-- Enable Hybrid Line Numbering
vim.wo.number = true

-- Editor
-- This will set file type detection to on
vim.opt.filetype = "on"
vim.opt.swapfile = false
-- This will add a line to the right after 160 characters
vim.opt.colorcolumn = "160"

-- Highlight search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Persistent UNDO
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Configure Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true

-- Word wrap
vim.opt.wrap = false
-- Break indent will keep the indent of the previous line
vim.opt.breakindent = true

-- Whichwrap allows for overflowing to a new line with h and l as well as left and right arrow
vim.opt.whichwrap = '<,>,h,l'

-- Always keep n lines of code visible on the bottom and top
vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast Updates
vim.opt.updatetime = 50

vim.opt.list = true
-- Set Visible Characters
vim.opt.listchars = {
	eol = '↵',
	space = '.',
	tab = '  >',
	trail = '-',
	extends = '>',
	precedes = '<',
}

-- Set the timeout for keybindings
-- Timeout is essentially, wait n milliseconds for the next key press
-- If the next key press is not received, then the key is treated as a single key press
vim.o.timeout = false
vim.o.timeoutlen = 300

-- Sync with system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Highlight cursor line
vim.wo.cursorline = true

-- Spelling
vim.opt_local.spell = true
vim.opt_local.spelllang = "en"

-- Performance
vim.opt.maxmempattern = 50000

-- Cmd line
-- This disables the cmdline
-- vim.opt.cmdheight = 0
