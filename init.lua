-- On startup:
-- 1. init.lua is read
-- require and setup of setup lazy does the following:
-- 2. All plugins with lazy=false are loaded. This includes sourcing /plugin and /ftdetect files. (/after will not be sourced yet)
-- 3. All files from /plugin and /ftdetect directories in your rtp are sourced (excluding /after)
-- 4. All /after/plugin files are sourced (this includes /after from plugins)
--    Files from runtime directories are always sourced in alphabetical order.

-- This is how to print a message that will be logged in :messages
-- print("hello from init.lua")

require 'config.helpers'
require 'config.keybindings' -- set keymap leader before loading plugins
require 'config.settings'

-- load plugins
require 'config.lazy_bootstrap'
require("lazy").setup("plugins")

require 'config.lsp'

-- Load local customizations last from local.lua, if it exists.
-- This file is not checked into git.
-- It contains environment-specific customizations, such as site-specific colorchemes
local path = script_path() .. 'lua/config/local.lua'
if file_exists(path) then
  require 'config.local'
else
  vim.cmd('colorscheme onedark')
end
