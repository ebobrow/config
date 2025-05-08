local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp('codeAction') end,
               { silent = true, buffer = bufnr })

vim.keymap.set("n", "K", function() vim.cmd.RustLsp({ 'hover', 'actions' }) end,
               { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>cd", function()
  vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>rr", function() vim.cmd.RustLsp('runnables') end,
               { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>rt", function() vim.cmd.RustLsp('testables') end,
               { silent = true, buffer = bufnr })

-- vim.keymap.set("n", "]d",
--                function() vim.cmd.RustLsp({ 'renderDiagnostic', 'cycle' }) end,
--                { silent = true, buffer = bufnr })

-- vim.keymap.set("n", "]d", function()
--   vim.diagnostic.jump { count = 1, float = false }
--   vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
-- end, { silent = true, buffer = bufnr })

-- vim.keymap.set("n", "[d", function()
--   vim.diagnostic.jump { count = -1, float = false }
--   vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
-- end, { silent = true, buffer = bufnr })

-- vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
