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
                { '<leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Breakpoint Condition' },
                { '<leader>dc', function() dap.continue() end, desc = 'Run/Continue' },
                { '<leader>di', function() dap.step_into() end, desc = 'Step Into' },
                { '<leader>do', function() dap.step_out() end, desc = 'Step Out' },
                { '<leader>dO', function() dap.step_over() end, desc = 'Step Over' },
                { '<leader>dP', function() dap.pause() end, desc = 'Pause' },
                { '<leader>dt', function() dap.terminate() end, desc = 'Terminate' },
                { '<leader>dl', function() dap.run_last() end, desc = 'Run Last' },
                { '<leader>dk', function() dap.up() end, desc = 'Up' },
                { '<leader>dj', function() dap.down() end, desc = 'Down' },

                -- { '<leader>da', function() dap.continue({ before = get_args }) end, desc = 'Run with Args' },
                { '<leader>dC', function() dap.run_to_cursor() end, desc = 'Run to Cursor' },
                { '<leader>dg', function() dap.goto_() end, desc = 'Go to Line (No Execute)' },
                { '<leader>dr', function() dap.repl.toggle() end, desc = 'Toggle REPL' },
                { '<leader>ds', function() dap.session() end, desc = 'Session' },
            }
        end,
    },
    {
        'igorlfs/nvim-dap-view',
        keys = {
            { '<leader>du', function() require('dap-view').toggle() end, desc = '[DAP view] Toggle' },
        },
        ---@module 'dap-view',
        ---@type dapview.Config
        opts = {
            winbar = {
                sections = { 'scopes', 'repl', 'watches', 'breakpoints', 'exceptions', 'threads'},
                default_section = 'scopes',
                controls = {
                    enabled = true,
                },
            },
            windows = {
                terminal = {
                    width = 0.5,
                    position = 'left',
                },
            },
            help = {
                border = 'rounded',
            },
            auto_toggle = true,
        },
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        optional = true,
        opts = {
            spec = {
                { '<leader>d', group = 'debug' },
            },
        },
        opts_extend = { 'spec' },
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
}
