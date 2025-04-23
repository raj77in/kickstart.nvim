require("nvim-tree").setup({
  -- Add any specific nvim-tree options here if desired
  -- See :help nvim-tree.OPTION_NAME
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

return {}
