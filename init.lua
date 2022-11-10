-- On startup:
-- 1. init.lua is read
-- 2. files in after/plugin/ are automatically read
--    (files in after/ are not automatically read, but it is available to use for require)

-- The order in which dirs/files are read is determined by the runtimepath (:se rtp)
-- this is the way to put debug messages in your lua config
vim.opt.incsearch = true

-- # This is how to print a message that will be logged in :messages
-- print("hello from init.lua")

require 'config.helpers'
require "config.keybindings"
require "config.settings"
require "config.plugins" -- could eliminate this by moving plugin config files to after/plugin

if os.getenv('INSTALL') then return end

require "config.lsp"
require "config.dap"

vim.cmd 'colorscheme onedark'

vim.keymap.set('n', '<c-q>', require'scripts'.quickfix_toggle)
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

vim.cmd 'hi LspReferenceText gui=italic guibg=#393e46'
vim.cmd 'hi LspReferenceRead gui=italic guibg=#393e46'
vim.cmd 'hi LspReferenceWrite gui=italic guibg=#393e46'

-- return true if file exists and is readable
function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

-- return the path to the dir containing this file (NOT the current working dir)
function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

-- Load local customizations last from local.lua, if it exists.
-- This file is not checked into git.
-- It contains environment-specific customizations, such as different colorchemes for different sites.
path = script_path() .. 'lua/config/local.lua'
if file_exists(path) then
  require 'config.local'
end
