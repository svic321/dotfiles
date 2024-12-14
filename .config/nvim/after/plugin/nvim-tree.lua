-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  sort = {
    sorter = "extension",
  },
  hijack_cursor = true,
  renderer = {
    indent_markers = {
      enable = true,
    },
    highlight_git = "name",
    icons = {
      git_placement = "right_align",
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "R",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = true,
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    -- Use default mappings
    api.config.mappings.default_on_attach(bufnr)

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Map `h` to go to parent directory
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))

    -- Map `l` to mimic Tab (preview)
    vim.keymap.set("n", "l", api.node.open.preview, opts("Preview"))
  end,
})

-- vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>t', ':NvimTreeFindFileToggle<CR>')
