local opts = { noremap=true, silent=true }

function CompileSomeRust()
    print("cargo check...")
    vim.cmd("silent make! check")
    vim.cmd("redraw!")
    local qf_list = vim.fn.getqflist()
    local error_count = 0
    local warning_count = 0
    if #qf_list > 0 then
        local collect_err = false
        local new_qf_list = {}
        for _, i in pairs(qf_list) do
            if i.type == "W" then
                warning_count = warning_count +1
                collect_err = false
            end
            if i.type == "E" then
                collect_err = true
                error_count = error_count + 1
            end
            if collect_err then
                table.insert(new_qf_list, i)
            end
        end
        vim.fn.setqflist(new_qf_list, 'r')
    end


    if error_count > 0 then
        if vim.fn.tabpagewinnr(vim.fn.tabpagenr(), '$') > 1 then
            vim.cmd('botright copen 6')
        else
            vim.cmd('copen 6')
        end
        vim.cmd('wincmd p')
        vim.cmd('cfirst')
    else
        vim.cmd('cclose')
    end

    local err_out = "echo 'E: " .. error_count .. "'"
    local warn_out = " | echon ' | W: " .. warning_count .. "'"
    vim.cmd(err_out .. warn_out)
end

vim.api.nvim_create_user_command(
    "Compile",
    CompileSomeRust,
    {}
)

vim.lsp.config("rust-analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-d>', '<cmd>:wa<CR>:Compile<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>:wa<CR>:Cargo run<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>t', '<cmd>:wa<CR>:Cargo test<CR>', opts)

        vim.g.rustfmt_autosave = 1
    end,
})
vim.lsp.enable("rust-analyzer")
