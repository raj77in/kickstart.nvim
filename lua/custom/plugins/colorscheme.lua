-- colorscheme
colormenu_path = vim.fn.expand('$HOME/.config/nvim/lua/util/colorspicker.lua')
vim.keymap.set("n", "<leader>cs", function()
  vim.cmd("luafile " .. colormenu_path)
end)

-- require('util.colorspicker')
-- vim.keymap.set("", "<leader>cs", '<cmd>lua colorspicker(require("telescope.themes").get_dropdown({}))<CR>', { noremap = true, silent = false })
--
return {}
