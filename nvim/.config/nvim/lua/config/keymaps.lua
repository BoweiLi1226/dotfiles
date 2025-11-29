local keymap = vim.keymap.set

-- diagnostics
keymap('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Previous Diagnostic' })
keymap('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Next Diagnostic' })
keymap('n', '[w', function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN }) end, { desc = 'Previous Warning' })
keymap('n', ']w', function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN }) end, { desc = 'Next Warning' })
keymap('n', '[e', function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Previous Error' })
keymap('n', ']e', function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Next Error' })
keymap('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })

-- lsp
keymap({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
keymap({ 'n', 'v' }, '<leader>cc', vim.lsp.codelens.run, { desc = 'Run Codelens' })
keymap('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename' })

-- buffer
keymap('n', '[b', ':bprevious<CR>', { desc = 'Previous Buffer' })
keymap('n', ']b', ':bnext<CR>', { desc = 'Next Buffer' })
