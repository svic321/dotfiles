return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      on_colors = function(colors)
        colors.border = colors.blue1
      end,
      on_highlights = function(hl, c)
        hl.BufferlineindicatorVisible = { bg = "#636DA6" }
        hl.IndentBlanklineIndent1 = { bg = "#363736" }
        hl.IndentBlanklineIndent2 = { bg = "#2d3739" }
        hl.IndentBlanklineIndent3 = { bg = "#362f41" }
        hl.IndentBlanklineIndent4 = { bg = "#2b3740" }
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
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      whitespace = {
        highlight = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
        },
        remove_blankline_trail = true,
      },
      scope = {
        enabled = false,
      },
    },
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
          files = {
            hidden = true,
            ignored = true,
          },
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
            ignored = true,
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
