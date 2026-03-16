require('mkdnflow').setup({

  modules = {
    bib = true,
    buffers = true,
    conceal = true,
    cursor = true,
    folds = true,
    foldtext = true,
    links = true,
    lists = true,
    maps = false,
    paths = true,
    tables = true,
    yaml = false,
    completion = false
  },

  filetypes = { "markdown", "rmd" },

  create_dirs = true,

  perspective = {
    priority = "first",
    fallback = "current",
    root_tell = true,
    nvim_wd_heel = true,
    update = true
  },

  wrap = false,

  bib = {
    default_path = nil,
    find_in_root = true
  },

  silent = false,

  cursor = {
    jump_patterns = nil
  },

  links = {
    style = "markdown",
    name_is_source = false,
    conceal = false,
    context = 0,
    implicit_extension = nil,
    transform_implicit = false,

    transform_explicit = function(text)
      text = text:gsub(" ", "-")
      text = text:lower()
      text = os.date("%Y-%m-%d_") .. text
      return text
    end,

    create_on_follow_failure = true
  },

  new_file_template = {
    use_template = true,

    template = [[
# {{ title }}
Date: {{ date }}
Filename: {{ filename }}
]],

    placeholders = {

      title = "link_title",

      date = function()
        return os.date("%A, %B %d, %Y")
      end,

      filename = function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }
  },

  to_do = {
  statuses = {
    todo  = { marker = " " },
    doing = { marker = "-" },
    done  = { marker = "X" },
  },

  status_order = { "todo", "doing", "done" },

  status_propagation = {
    up = true,
  },
},

  foldtext = {
  object_count = true,
  line_count = true,
  line_percentage = true,
  word_count = true,

  object_count_opts = function()
    return require("mkdnflow").foldtext.default_count_opts()
  end,

  title_transformer = nil,

  fill_chars = {
    left_edge = "⢾",
    right_edge = "⡷",
    left_inside = " ⣹",
    right_inside = "⣏ ",
    middle = "⣿",
  },
},

  tables = {
    trim_whitespace = true,
    format_on_move = true,
    auto_extend_rows = false,
    auto_extend_cols = false,

    style = {
      cell_padding = 1,
      separator_padding = 1,
      outer_pipes = true,
      mimic_alignment = true
    }
  },

  yaml = {
    bib = { override = false }
  },

  mappings = {

    MkdnEnter = { { "n", "v" }, "<CR>" },

    MkdnTab = false,
    MkdnSTab = false,

    MkdnNextLink = { "n", "<Tab>" },
    MkdnPrevLink = { "n", "<S-Tab>" },

    MkdnNextHeading = { "n", "]]" },
    MkdnPrevHeading = { "n", "[[" },

    MkdnGoBack = { "n", "<BS>" },
    MkdnGoForward = { "n", "<Del>" },

    MkdnCreateLink = false,

    MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>p" },

    MkdnFollowLink = false,

    MkdnDestroyLink = { "n", "<M-CR>" },

    MkdnTagSpan = { "v", "<M-CR>" },

    MkdnMoveSource = { "n", "<F2>" },

    MkdnYankAnchorLink = { "n", "yaa" },
    MkdnYankFileAnchorLink = { "n", "yfa" },

    MkdnIncreaseHeading = { "n", "+" },
    MkdnDecreaseHeading = { "n", "-" },

    MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },

    MkdnNewListItem = false,
    MkdnNewListItemBelowInsert = { "n", "o" },
    MkdnNewListItemAboveInsert = { "n", "O" },

    MkdnExtendList = false,

    MkdnUpdateNumbering = { "n", "<leader>nn" },

    MkdnTableNextCell = { "i", "<Tab>" },
    MkdnTablePrevCell = { "i", "<S-Tab>" },

    MkdnTableNextRow = false,
    MkdnTablePrevRow = { "i", "<M-CR>" },

    MkdnTableNewRowBelow = { "n", "<leader>ir" },
    MkdnTableNewRowAbove = { "n", "<leader>iR" },

    MkdnTableNewColAfter = { "n", "<leader>ic" },
    MkdnTableNewColBefore = { "n", "<leader>iC" },

    MkdnFoldSection = { "n", "<leader>f" },
    MkdnUnfoldSection = { "n", "<leader>F" },
  }

})
return {}
