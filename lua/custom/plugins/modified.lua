local augroups = {}

augroups.misc = {
  change_header = {
    event = "BufWritePre",
    pattern = "*",
    callback = function()
      require('util.modified').changeheader()
    end,
  },
}

for group, commands in pairs(augroups) do
  local augroup = vim.api.nvim_create_augroup("AU_" .. group, { clear = true })

  for _, opts in pairs(commands) do
    local event = opts.event
    opts.event = nil
    opts.group = augroup
    vim.api.nvim_create_autocmd(event, opts)
  end
end

return {}
