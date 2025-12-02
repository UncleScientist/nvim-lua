require("config.lazy")
require('mason').setup()
require("lsp.rust")

vim.cmd("colorscheme habamax")
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- Enable syntax highlighting
  },
}

vim.diagnostic.config({
    virtual_text = true,
})

vim.api.nvim_set_hl(0, "Normal", { bg = "Black" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "Cyan" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666666" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666666" })

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.ruler = true
vim.o.signcolumn = "number"
vim.o.relativenumber = true
vim.o.number = true
vim.o.clipboard = "unnamedplus"
vim.o.mouse = ""
vim.o.colorcolumn = "100"
vim.o.guicursor = ""
vim.o.splitright = true
vim.o.splitbelow = true
