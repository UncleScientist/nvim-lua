return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = { "rust", "lua", "vimdoc", "javascript", "typescript", "html", "css" },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
