local ci = require('clipboard-image')

ci.ft = { "markdown" }
ci.setup({

  -- Default configuration for all filetype
  default = {
    -- img_dir = {'%:t:r',"images"} ,
    img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
    img_dir_txt = function()
      return { "image", vim.fn.expand("%:t:r") }
    end,
    img_dir = function()
      return { "image", vim.fn.expand("%:t:r") }
    end,
    affix = "![](%s)",

    -- affix = "<\n  %s\n>" -- Multi lines affix
  }
})
vim.keymap.set({ 'n', 'v' }, '<leader>cv', '<cmd>PasteImg<CR>')

return {}
