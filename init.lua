require 'config.helpers'

require "config.keybindings"
require "config.settings"
require "config.plugins"

if os.getenv('INSTALL') then return end

require "config.lsp"
require "config.dap"

vim.cmd 'colorscheme onedark'

-- vim.keymap.set('n', '<c-q>', require'scripts'.quickfix_toggle)
-- vim.keymap.set('n', '<space>f', require'scripts'.send_to_tmux)
-- vim.keymap.set('n', '<leader>f', function() require'scripts'.send_to_tmux(true) end)
vim.keymap.set('n', '<space>og', require'finders'.git)
vim.keymap.set('n', '<space>oo', require'finders'.find)
vim.keymap.set('n', '<space>ob', '<cmd> Telescope buffers<cr>')

vim.keymap.set('n', '<space>oq', function()
  require'finders'.find {
    cwd = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h'),
    pattern = "(lua|vim)$"
  }
end)

vim.keymap.set('n', '<space>of', require'finders'.grep)
vim.keymap.set('n', '<space>of', "<cmd>lua require'finders'.live_grep()<cr>")
vim.keymap.set('n', '<space>ow', "<cmd>Telescope workspaces<cr>")
vim.keymap.set('n', '<space>oh', "<cmd>Telescope help_tags<cr>")
vim.keymap.set('n', '<space>oz', "<cmd>Telescope zoxide list<cr>")
vim.keymap.set('n', '<space><c-o><c-o>', "<cmd>Telescope resume<cr>")
vim.keymap.set('n', '<space>o<c-o>', "<cmd>Telescope resume<cr>")

vim.cmd([[nmap <leader>t <Plug>PlenaryTestFile]])

function underscore(self)
  return self:gsub("([A-Z]+)([A-Z][a-z])", "%1_%2"):
              gsub("([a-z%d])([A-Z])", "%1_%2"):
              gsub("[ \t]", "_"):
              lower()
end

function camelize(self)
  return underscore(self):gsub("[ \t_%-](.)", string.upper)
end

function capitalize(self)
  return self:lower():gsub("^%l", string.upper)
end


vim.cmd 'hi LspReferenceText gui=italic guibg=#393e46'
vim.cmd 'hi LspReferenceRead gui=italic guibg=#393e46'
vim.cmd 'hi LspReferenceWrite gui=italic guibg=#393e46'
