require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors)
    colors.fg_gutter = "#777da0"
    colors.bg_sidebar = default
    colors.bg_float = default

  end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors)
    -- standard highlights
    highlights.LineNrAbove = { fg = "#5a6c97"}
    highlights.LineNrBelow = { fg = "#5a6c97"}
    highlights.CursorLineNr = { fg = "#7bcfff"}
    highlights.WinSeparator = { fg = "#5A6C97" }
    highlights.CursorLine = { bg = "#373c51" }
    highlights.FoldColumn = { fg = "#008080" }
    highlights.Folded = { bg = "#0a4554", italic = true }
    highlights.EndOfBuffer = { fg = "#5a6c97" }
    highlights.NonText = { fg = "#CB8909" }
    -- gitsigns highlights
    highlights.GitSignsAdd = { fg = "#00ff00" }
    highlights.GitSignsChange = { fg = "#f0f000" }
    highlights.GitSignsDelete = { fg = "#ff0000" }
    highlights.GitSignsAddLnInline = { fg = "#00ff00" }
    highlights.GitSignsChangeLnInline = { fg = "#f0f000" }
    highlights.GitSignsDeleteLnInline = { fg = "#ff0000" }
    highlights.GitSignsStagedAdd = { fg = "#baffc9" }
    highlights.GitSignsStagedChange = { fg = "#ffffba" }
    highlights.GitSignsStagedDelete = { fg = "#ffb3ba" }
    -- barbar highlights
    highlights.BufferCurrent = { bg = "#5A6C93" }
    highlights.BufferCurrentSign = { fg = "#5A6C93", bg = default }
    highlights.BufferCurrentMod = { fg = default, bg = "#5A6C93" }
    highlights.BufferCurrentModBtn = { fg = "#FBB86C", bg = "#5A6C93" }
    highlights.BufferCurrentERROR = { fg = red, bg = "#5A6C93" }
    highlights.BufferCurrentHINT = { bg = "#5A6C93" }
    highlights.BufferCurrentTarget = { bg = "#5A6C93" }
    highlights.BufferCurrentADDED = { bg = "#5A6C93", fg = "#00ff00" }
    highlights.BufferCurrentCHANGED = { bg = "#5A6C93", fg = "#f0f000" }
    highlights.BufferCurrentDELETED = { bg = "#5A6C93", fg = "#ff0000" }
    highlights.BufferVisibleADDED = { fg = "#00ff00" }
    highlights.BufferVisibleCHANGED = { fg = "#f0f000" }
    highlights.BufferVisibleDELETED = { fg = "#ff0000" }
    -- hi BufferTabpageFill guibg=NONE guifg=NONE
    -- nvim-tree highlights
    highlights.NvimTreeGitDeletedIcon = { fg = "#ff0000" }
    highlights.NvimTreeGitDirtyIcon = { fg = "#ff9e64" }
    highlights.NvimTreeGitIgnoredIcon = { fg = "#777da0" }
    highlights.NvimTreeGitMergeIcon = { fg = "#AB85FF" }
    --highlights.NvimTreeGitNewIcon = { fg = "#0000ff" }
    highlights.NvimTreeGitRenamedIcon = { fg = "#f0f000" }
    highlights.NvimTreeGitStagedIcon = { fg = "#71C567" }

  end,
})
