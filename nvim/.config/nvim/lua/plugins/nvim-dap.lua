return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            { 'theHamsta/nvim-dap-virtual-text', opts = {} },
        },
        keys = function()
            local dap = require 'dap'
            return {
                { '<leader>db', function() dap.toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
                { '<leader>dc', function() dap.continue() end, desc = 'Run/Continue' },
                { '<leader>di', function() dap.step_into() end, desc = 'Step Into' },
                { '<leader>do', function() dap.step_out() end, desc = 'Step Out' },
                { '<leader>dO', function() dap.step_over() end, desc = 'Step Over' },
                { '<leader>dk', function() dap.up() end, desc = 'Up' },
                { '<leader>dj', function() dap.down() end, desc = 'Down' },

                { '<leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Breakpoint Condition' },
                -- { '<leader>da', function() dap.continue({ before = get_args }) end, desc = 'Run with Args' },
                { '<leader>dC', function() dap.run_to_cursor() end, desc = 'Run to Cursor' },
                { '<leader>dg', function() dap.goto_() end, desc = 'Go to Line (No Execute)' },
                { '<leader>dl', function() dap.run_last() end, desc = 'Run Last' },
                { '<leader>dP', function() dap.pause() end, desc = 'Pause' },
                { '<leader>dr', function() dap.repl.toggle() end, desc = 'Toggle REPL' },
                { '<leader>ds', function() dap.session() end, desc = 'Session' },
                { '<leader>dt', function() dap.terminate() end, desc = 'Terminate' },
            }
        end,
    },

    {
        'igorlfs/nvim-dap-view',
        ---@module 'dap-view',
        ---@type dapview.Config,
        opts = {},
    },

    {
        'rcarriga/nvim-dap-ui',
        enabled = false,
        dependencies = {
            'nvim-neotest/nvim-nio',
        },
        keys = function()
            local dapui = require 'dapui'
            local dap_ui_widgets = require 'dap.ui.widgets'
            return {
                { '<leader>du', function() dapui.toggle({ }) end, desc = 'Dap UI' },

                { '<leader>de', function() dapui.eval() end, desc = 'Eval', mode = {'n', 'v'} },
                { '<leader>dw', function() dap_ui_widgets.hover() end, desc = 'Widgets' },
            }
        end,
        opts = {},
        config = function(_, opts)
            local dap, dapui = require 'dap', require 'dapui'
            dapui.setup(opts)
            dap.listeners.before.attach.dapui_config = function() dapui.open({}) end
            dap.listeners.before.launch.dapui_config = function() dapui.open({}) end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close({}) end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close({}) end
        end,
    },

    {
        'leoluz/nvim-dap-go',
        opts = {},
    },

    {
        'mfussenegger/nvim-dap-python',
        config = function(_, _)
            require('dap-python').setup(vim.fn.stdpath('data') .. '/mason/packages/debugpy/debugpy-adapter')
        end
    },
}
