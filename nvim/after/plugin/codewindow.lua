local codewindow = require('codewindow')
codewindow.setup({
  active_in_terminals = false, -- Should the minimap activate for terminal buffers
  auto_enable = true, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
  minimap_width = 20, -- The width of the text part of the minimap
})
codewindow.apply_default_keybinds()
