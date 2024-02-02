-- ~/.config/nvim/lua/util/modified.luq

local M = {}

M.changeheader = function()
	-- We only can run this function if the file is modifiable
	local bufnr = vim.api.nvim_get_current_buf()
	if not vim.api.nvim_buf_get_option(bufnr, "modifiable") then
		require("notify")("Current file not modifiable!")
		return
	end
	-- if not vim.api.nvim_buf_get_option(bufnr, "modified") then
	--     require("notify")("Current file has not changed!")
	--     return
	-- end
	if vim.fn.line("$") >= 7 then
		os.setlocale("en_US.UTF-8") -- show Sun instead of dom (portuguese)
		local time = os.date("%a, %d %b %Y %H:%M:%S")
		local l = 1
		while l <= 7 do
			vim.fn.setline(l, vim.fn.substitute(vim.fn.getline(l), 'last change: \\zs.*', time, 'gc'))
			l = l + 1
		end
		if vim.fn.search('\\v?ast (?hange|?pdate|?pdated):?', 'wncp') > 0 then
			require("notify")("Changed file header!")
		end
	end
end

return M
