local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
-- vim.keymap.set('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
-- vim.keymap.set('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- " Use <Tab> and <S-Tab> for command-line completion navigation
-- cnoremap <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
-- cnoremap <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

-- -- Example for file path completion in Normal Mode using Tab
vim.api.nvim_set_keymap('n', '<Tab>', ':edit <C-d>', { noremap = true, silent = true })

return {}
