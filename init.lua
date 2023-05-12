-- On startup:
-- 1. init.lua is read
-- require and setup of setup lazy does the following:
-- 2. All plugins with lazy=false are loaded. This includes sourcing /plugin and /ftdetect files. (/after will not be sourced yet)
-- 3. All files from /plugin and /ftdetect directories in your rtp are sourced (excluding /after)
-- 4. All /after/plugin files are sourced (this includes /after from plugins)
--    Files from runtime directories are always sourced in alphabetical order.

-- Debugging tips
--   * Neovim mostly logs to ~/.local/state/nvim/
--   * This is how to print a message that will be logged in :messages :
--     print("hello from init.lua")

-- Pre-plugin configuration
require 'config.helpers'
require 'config.keybindings' -- set keymap leader before loading plugins
require 'config.settings'
local path = script_path() .. 'lua/config/local_before.lua'
if file_exists(path) then
  require 'config.local_before'
end

-- Load plugins
require 'config.lazy_bootstrap'
if vim.g.netapp then
  require('config.netapp')
else
  local opts = {
    change_detection = { notify = false }, -- don't notify me when the neovim config files are changed
  }
  require('lazy').setup('plugins', opts)
end

-- Post-plugin configuration
path = script_path() .. 'lua/config/local_after.lua'
if file_exists(path) then
  require 'config.local_after'
else
  vim.cmd('colorscheme onedark')
end

require 'config.lsp'
