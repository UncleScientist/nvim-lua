return {
    "neovim/nvim-lspconfig",
    ft = "rust",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("lsp.rust")
    end,
}
