require("nvim-fencepolish").setup({
  formatters = {
    json = "jq",
    python = "black -q -",
    lua = "stylua -",
    javascript = "prettier --parser babel",
    typescript = "prettier --parser typescript",
    sh = "shfmt",
  },
  keymap = "<leader>fp", -- Format fenced block under cursor
})

return {}
