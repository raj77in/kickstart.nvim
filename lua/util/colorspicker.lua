-- Colorscheme Picker for Neovim using Telescope
-- This script allows you to dynamically switch colorschemes using Telescope
-- and persist the selection across sessions.

local M = {}  -- Define module
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- List of colorschemes to ignore (these are default Vim themes)
local disable = {
    "darkblue", "default", "delek", "desert", "elflord", "evening",
    "industry", "koehler", "morning", "murphy", "pablo", "peachpuff",
    "ron", "shine", "slate", "torte", "blue", "habamax",
    "lunaperche", "quiet", "zellner",
}

-- File path to store the last used colorscheme (persists selection across restarts)
local file_path = os.getenv("HOME") .. "/.config/nvim/lua/util/colorscheme-persist.lua"

-- Get the current colorscheme
local current_color = vim.api.nvim_command_output("color")

-- Function to retrieve available colorschemes, filtering out the disabled ones
local function get_colors()
    local colors = {}  -- Store valid colorschemes
    local all_colors = vim.fn.getcompletion("", "color")  -- Get all available colorschemes

    for _, color in ipairs(all_colors) do
        local ignored = false
        for _, disabled_color in ipairs(disable) do
            if color == disabled_color then
                ignored = true
                break
            end
        end
        if not ignored then
            table.insert(colors, color)
        end
    end
    return colors
end

-- Function to open Telescope UI for colorscheme selection
local colorspicker = function(opts)
    opts = opts or {}
    local before_color = current_color  -- Store current colorscheme
    local colors = get_colors() or { before_color }  -- Get available colors

    -- Ensure current colorscheme appears at the top of the list
    if not vim.tbl_contains(colors, before_color) then
        table.insert(colors, 1, before_color)
    end

    -- Ensure the current colorscheme is not repeated in the list
    colors = vim.list_extend(
        { before_color },
        vim.tbl_filter(function(color)
            return color ~= before_color
        end, colors)
    )

    -- Create the Telescope picker
    pickers
        .new(opts, {
            prompt_title = "Choose Colorscheme | Current: " .. before_color,
            finder = finders.new_table({
                results = colors,
            }),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    vim.cmd("colorscheme " .. selection[1])  -- Apply the selected colorscheme


                   -- Fix Markdown Conceal Issue (Ensures that syntax highlighting doesn't break)
                    vim.cmd([[
                        augroup FixMarkdownConceal
                            autocmd!
                autocmd ColorScheme * highlight Conceal guifg=NONE guibg=NONE
                autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
                autocmd FileType markdown highlight Conceal guifg=NONE guibg=NONE
                            autocmd ColorScheme * highlight Conceal guifg=NONE guibg=NONE
                        augroup END
                    ]])

                    -- Persist selected colorscheme in a file
                    local write = string.format("vim.cmd.colorscheme('%s')", selection[1])
                    require("lazy.util").write_file(file_path, write)
                end)
                return true
            end,
        })
        :find()
end

-- Call the colorspicker function with a dropdown UI
colorspicker(require("telescope.themes").get_dropdown({}))

return {}  -- Return module for use in other scripts

