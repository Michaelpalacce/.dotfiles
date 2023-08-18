vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end, { desc = 'Open Trouble' })
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end,
    { desc = 'Workspace workspace_diagnostics' })
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end,
    { desc = 'Current document diagnostics' })
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end, { desc = 'Trouble quickfix' })
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end, { desc = 'Trouble loclist' })
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end, { desc = 'trouble lsp references' })
