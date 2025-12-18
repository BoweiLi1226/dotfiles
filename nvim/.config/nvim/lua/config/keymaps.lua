local keymap = vim.keymap.set

-- diagnostics
keymap('n', '[w', function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN }) end, { desc = 'Previous Warning' })
keymap('n', ']w', function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN }) end, { desc = 'Next Warning' })
keymap('n', '[e', function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Previous Error' })
keymap('n', ']e', function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, { desc = 'Next Error' })

-- buffer
keymap('n', '[b', ':bprevious<CR>', { desc = 'Previous Buffer' })
keymap('n', ']b', ':bnext<CR>', { desc = 'Next Buffer' })

-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, lhs, rhs, desc)
            keymap(mode, lhs, rhs, { buffer = event.buf, desc = desc })
        end
        bufmap({ 'n', 'v' }, '<leader>cc', vim.lsp.codelens.run, 'Run Codelens')
    end
})
