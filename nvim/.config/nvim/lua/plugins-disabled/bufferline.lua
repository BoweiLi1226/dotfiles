return {
    "akinsho/bufferline.nvim",
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

