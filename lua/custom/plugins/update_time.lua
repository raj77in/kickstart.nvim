vim.api.nvim_create_augroup("UpdateLastModified", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "UpdateLastModified",
  pattern = "*",
  callback = function()
    -- Disable the 'changed' flag temporarily
    vim.cmd('silent! write')

    local file_path = vim.fn.expand("%:p")
    local file = io.open(file_path, "r+")
    if file then
      local content = file:read("*all")
      file:seek("set", 0)

      -- Get current timestamp and update "Last modified" line
      local modified_time = os.date("%Y-%m-%d %H:%M:%S")
      content = content:gsub("Last modified: .+", "Last modified: " .. modified_time)

      -- If "Last modified" is not found, add it at the top
      if not content:match("Last modified:") then
        content = "# Last modified: " .. modified_time .. "\n" .. content
      end

      -- Write the modified content back to the file
      file:write(content)
      file:close()

      -- Mark the buffer as no longer modified to avoid warning on save
      vim.cmd('noa write')
    end
  end
})

return {}
