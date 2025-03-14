local cmp = require'cmp'

cmp.setup({
  completion = {
    autocomplete = { require'cmp.types'.cmp.TriggerEvent.InsertEnter, require'cmp.types'.cmp.TriggerEvent.TextChanged },
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  }),
  experimental = {
    ghost_text = true, -- For inline suggestions
  },
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' }
  },
})

