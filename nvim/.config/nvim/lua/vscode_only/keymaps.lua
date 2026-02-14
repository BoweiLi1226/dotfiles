local vscode = require("vscode")

local keymap = vim.keymap.set

keymap({'n', 'v'}, "<leader>/", function()
    vscode.action("workbench.action.findInFiles")
end)

keymap({'n', 'v'}, "<leader>ff", function()
    vscode.action("workbench.action.quickOpen")
end)

keymap({'n', 'v'}, "<leader>sC", function()
    vscode.action("workbench.action.showCommands")
end)

keymap({'n', 'v'}, "<leader>e", function()
    vscode.action("workbench.view.explorer")
end)

keymap('n', "<C-w>d", function()
    vscode.call("editor.action.showHover")
end)

keymap('n', '<leader>bd', function()
    vscode.action('workbench.action.closeActiveEditor')
end, {})
