require("config.lazy")

-- I like habamax, but with a black background
vim.cmd("colorscheme habamax")
vim.api.nvim_set_hl(0, "Normal", { bg = "Black" })

-- Make the relative line numbers darker so that the
-- current line number stands out
vim.api.nvim_set_hl(0, "LineNr", { fg = "Cyan" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666666" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666666" })

vim.keymap.set("n", "<space>ch", function()
    vim.cmd("colorscheme habamax")
    vim.api.nvim_set_hl(0, "Normal", { bg = "Black" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "Cyan" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666666" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666666" })
end)
vim.keymap.set("n", "<space>cm", function()
    vim.cmd("colorscheme murphy")
    vim.api.nvim_set_hl(0, "LineNr", { fg = "Cyan" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666666" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666666" })
end)
--        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Errors show up directly in the editor
vim.diagnostic.config({
    virtual_text = true,
})

vim.o.wildmenu = true
vim.o.wildmode = full
vim.o.completeopt = "menu,preview"
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.ruler = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.clipboard = ""
vim.o.mouse = ""
vim.o.colorcolumn = "100"
vim.o.guicursor = ""
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Make sure the display doesn't shift left & right when
-- errors appear and are fixed. Why this isn't the default
-- is puzzling.
vim.o.signcolumn = "number"

-- De-highlight the search term after finishing the search
vim.on_key(function(char)
    if vim.fn.mode() == "n" then
        local key = vim.fn.keytrans(char)
        local is_search = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, key)
        if vim.o.hlsearch ~= is_search then
            vim.o.hlsearch = is_search
        end
    end
end, vim.api.nvim_create_namespace("auto_hlsearch"))
