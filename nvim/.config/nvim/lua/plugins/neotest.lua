return {
    'nvim-neotest/neotest',

    dependencies = {
        'nvim-neotest/nvim-nio',
        'antoinemadec/FixCursorHold.nvim',

        {
            'fredrikaverpil/neotest-golang',
            version = '*',
            -- Install gotestsum using go from system
            build = function()
                vim.system({"go", "install", "gotest.tools/gotestsum@latest"}):wait()
            end,
        },
        'nvim-neotest/neotest-python',
    },

    keys = function()
        local neotest = require 'neotest'

        return {
            { '<leader>tt', function() neotest.run.run(vim.fn.expand('%')) end, desc = 'Run File (Neotest)' },
            { '<leader>tT', function() neotest.run.run(vim.uv.cwd()) end, desc = 'Run All Test Files (Neotest)' },
            { '<leader>tr', function() neotest.run.run() end, desc = 'Run Nearest (Neotest)' },
            { '<leader>tl', function() neotest.run.run_last() end, desc = 'Run Last (Neotest)' },
            { '<leader>ts', function() neotest.summary.toggle() end, desc = 'Toggle Test Summary (Neotest)' },
            { '<leader>to', function() neotest.output.open({ enter = true, auto_close = true }) end, desc = 'Show Output (Neotest)' },
            { '<leader>tO', function() neotest.output_panel.toggle() end, desc = 'Toggle Output Panel (Neotest)' },
            { '<leader>tS', function() neotest.run.stop() end, desc = 'Stop (Neotest)' },
            { '<leader>tw', function() neotest.watch.toggle(vim.fn.expand('%')) end, desc = 'Toggle Watch (Neotest)' },

            -- start test with debugger
            { '<leader>td', function() neotest.run.run({ strategy = 'dap' }) end, desc = 'Debug Nearest (DAP)' },
        }
    end,

    opts = function()
        return {
            adapters = {
                require('neotest-golang')({
                    runner = 'gotestsum',
                }),
                require('neotest-python')({}),
            },
            status = { virtual_test = true },
            output = { open_on_run = true },
        }
    end,
}
