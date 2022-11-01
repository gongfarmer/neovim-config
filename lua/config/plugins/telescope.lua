local Telescope = require("telescope")
local actions = require("telescope.actions")

Telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      },
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
})

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('workspaces')
require('telescope').load_extension('zoxide')

-- These don't have any effect, why?
-- I moved them to keybindings.lua, they work fine there
echom("FRASER setting telescope keymaps")
vim.cmd('nnoremap ;f <cmd>lua require("telescope.builtin").find_files()<cr>')
vim.cmd('nnoremap ;b <cmd>lua require("telescope.builtin").buffers()<cr>')
vim.cmd('nnoremap ;r <cmd>lua require("telescope.builtin").live_grep()<cr>')
vim.cmd('nnoremap ;; <cmd>lua require("telescope.builtin").help_tags()<cr>')
