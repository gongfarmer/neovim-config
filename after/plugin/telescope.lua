-- based on kickstart.nvim

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sf', '<cmd> Telescope find_files<cr>', { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', '<cmd> Telescope help_tags<cr>', { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', '<cmd> Telescope grep_string<cr>', { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', '<cmd> Telescope live_grep<cr>', { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', '<cmd> Telescope diagnostics<cr>', { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sk', '<cmd> Telescope keymaps<cr>', { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sld', '<cmd> Telescope lsp_definitions<cr>', { desc = '[S]earch [L]sp [D]efinitions' })
vim.keymap.set('n', '<leader>slr', '<cmd> Telescope lsp_references<cr>', { desc = '[S]earch [L]sp [R]eferences' })
vim.keymap.set('n', '<leader><c-o><c-o>', '<cmd> Telescope resume<cr>', { desc = 'Telescope resume last search' })
vim.keymap.set('n', '<leader>o<c-o>', '<cmd> Telescope resume<cr>', { desc = 'Telescope resume last search' })

vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end,
  { desc = '[/] Fuzzily search in current buffer' }
)

vim.keymap.set('n', '<leader>oq', function()
    cwd = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h')
    require('telescope.builtin').find_files({ search_dirs={cwd}})
  end,
  { desc = "Find files in nvim config dir"}
)

