return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true, sources = { explorer = { focus = "input", auto_close = true } } },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },
    keys = {
        {
            "<space>o",
            function()
                Snacks.picker.smart()
            end,
            desc = "File explorer",
        },
    },
}
