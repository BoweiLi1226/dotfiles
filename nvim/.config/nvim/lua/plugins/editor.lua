return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    },
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        opts = {},
    },
    {
        'gbprod/yanky.nvim',
        opts = {
            highlight = {
                on_put = true,
                on_yank = true,
                timer = 500,
            },
        },
    },
}
