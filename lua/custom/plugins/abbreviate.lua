vim.cmd('abbr aka "Amit Agarwal"')
vim.cmd('ab akae "Amit Agarwal <amit.agarwal@mobileum.com>"')
vim.cmd('ab `g ```go<CR>')
vim.cmd('ab `p ```python<CR>')
vim.cmd('ab `b ```bash<CR>')
-- vim.cmd('ab h1 #')
-- vim.cmd('ab h2 ##')
-- vim.cmd('ab h3 ###')
-- vim.cmd('ab h4 ####')
vim.cmd([[iabbr h1 <C-o>0# <C-o>$<CR>]])
vim.cmd([[iabbr h2 <C-o>0## <C-o>$<CR>]])
vim.cmd([[iabbr h3 <C-o>0### <C-o>$<CR>]])
vim.cmd([[iabbr h4 <C-o>0#### <C-o>$<CR>]])
-- vim.api.nvim_set_keymap('i', '``', '<C-o>b``<C-o>e`<C-o>l', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '``', '<C-o>b``<C-o>e`<C-o>l', { noremap = true, silent = true })
-- vim.cmd("abbr `` <C-o>b``<C-o>e`<C-o>l")


return {}
