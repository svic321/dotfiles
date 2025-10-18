return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      on_colors = function(colors)
        colors.border = colors.blue1
      end,
      on_highlights = function(highlights, colors)
        highlights.BufferlineindicatorVisible = { bg = "#636DA6" }
        -- highlights.BufferlineindicatorSelected = { bg = colors.blue1 }
      end,
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  { "bullets-vim/bullets.vim" },
  { "godlygeek/tabular" },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
  },
  { "nvim-treesitter/nvim-treesitter-context", opts = {} },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.inactive_winbar = {
        lualine_a = { "filename" },
        lualine_b = { "filetype" },
        lualine_z = { "location" },
      }
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      explorer = { enabled = true }, -- NOT HERE!
      picker = {
        enabled = true,
        sources = {
          explorer = { -- HERE!
            layout = {
              { preview = true },
              layout = {
                winblend = 10,
                box = "horizontal",
                width = 0.8,
                height = 0.8,
                {
                  box = "vertical",
                  border = "rounded",
                  title = "{source} {live} {flags}",
                  title_pos = "center",
                  { win = "input", height = 1, border = "bottom" },
                  { win = "list", border = "none" },
                },
                { win = "preview", border = "rounded", width = 0.7, title = "{preview}" },
              },
            },
            enabled = true,
            hidden = true,
            auto_close = true,
            win = {
              list = {
                keys = {
                  ["O"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
  },
}
