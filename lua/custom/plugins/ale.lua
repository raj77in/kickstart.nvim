require('packer').startup(function()
  use 'dense-analysis/ale'
end)

vim.g.ale_lint_on_text_changed = 'always'
vim.g.ale_lint_on_insert_leave = 1
vim.g:ale_lint_on_enter = 1
vim.g:ale_lint_on_text_changed = 'always'
vim.g:ale_lint_on_save = 1

return {}
