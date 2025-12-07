return {
    "akinsho/bufferline.nvim",
    enabled = false,
    version = "*",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                offsets = {
                    {
                        filetype = "snacks_layout_box",
                        text = "File Explorer",
                        text_align = "center",
                    }
                }
            }
        })
    end,
}

