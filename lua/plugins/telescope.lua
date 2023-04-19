-- Fuzzy Finder Algorithm which requires local dependencies to be built.
-- Only load if `make` is available. Make sure you have the system
-- requirements installed.
-- FIXME: switched to this stock kickstart.vim config, before I used telescope-fzy-native
-- What is the difference between fzy-native and fzf-native?

return {
  'nvim-telescope/telescope-fzf-native.nvim',
  -- NOTE: If you are having trouble with this installation,
  --       refer to the README for telescope-fzf-native for more instructions.
  build = 'make',
  cond = function()
    return vim.fn.executable 'make' == 1
  end,
  set = function ()
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

    -- FIXME this is not being setup properly
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })

    end, { desc = '[/] Fuzzily search in current buffer]' })
    require('telescope').load_extension('fzy_native')
    require('telescope').load_extension('workspaces')
    require('telescope').load_extension('zoxide')
    require("telescope").load_extension('harpoon')
  end,
  keys = {
    -- (use C-n and C-p to move selection up or down in Telescope)
    -- keymaps are named after the shortest set of chars describing the telescope command
    -- To see all available pickers: :Telescope builtin
    { '<leader><space>', '<cmd> Telescope buffers<cr>', desc = 'Search open buffers' },
    { '<leader>sf', '<cmd> Telescope find_files<cr>', desc = '[S]earch [F]iles' },
    { '<leader>sh', '<cmd> Telescope help_tags<cr>', desc = '[S]earch [H]elp' },
    { '<leader>sw', '<cmd> Telescope grep_string<cr>', desc = '[S]earch current [W]ord' },
    { '<leader>sg', '<cmd> Telescope live_grep<cr>', desc = '[S]earch [G]rep' },
    { '<leader>sd', '<cmd> Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
    { '<leader>sk', '<cmd> Telescope keymaps<cr>', desc = '[S]earch [K]eymaps' },
    { '<leader>sld', '<cmd> Telescope lsp_definitions<cr>', desc = '[S]earch [L]sp [D]efinitions' },
    { '<leader>slr', '<cmd> Telescope lsp_references<cr>', desc = '[S]earch [L]sp [R]eferences' },
    { '<leader>s?', '<cmd> Telescope oldfiles<cr>', desc = '[S]earch recently opened files' },
    { '<leader><c-o><c-o>', '<cmd> Telescope resume<cr>', desc = 'Telescope resume last search' },
    { '<leader>o<c-o>', '<cmd> Telescope resume<cr>', desc = 'Telescope resume last search' },
  },
}

