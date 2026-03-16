-- LSP keybindings when server attaches
local on_attach = function(client, bufnr)

  local map = function(mode, key, cmd)
    vim.keymap.set(mode, key, cmd, { buffer = bufnr, silent = true })
  end

  -- enable completion
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "<C-k>", vim.lsp.buf.signature_help)

  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
  map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)

  map("n", "<space>D", vim.lsp.buf.type_definition)
  map("n", "<space>rn", vim.lsp.buf.rename)
  map("n", "gr", vim.lsp.buf.references)

  map("n", "<space>e", vim.diagnostic.open_float)
  map("n", "[d", vim.diagnostic.goto_prev)
  map("n", "]d", vim.diagnostic.goto_next)
  map("n", "<space>q", vim.diagnostic.setloclist)

  map("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end)

end


-- servers to enable
local servers = {
  bashls = {},
  marksman = {},
  pyright = {},
}


for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.flags = { debounce_text_changes = 150 }

  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
return {}
