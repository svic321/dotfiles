local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--no-ignore', -- Add this line to include files ignored by .gitignore
    },
    file_ignore_patterns = { ".git/" },
    path_display = { "truncate" },
  },
  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--no-ignore', '--hidden' }, -- Add this line to include files ignored by .gitignore
    },
    live_grep = {
      additional_args = function(opts)
        return {"--hidden", "--no-ignore"}
      end
    },
  },
}

