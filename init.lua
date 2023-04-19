-- On startup:
-- 1. init.lua is read
-- 2. files in after/plugin/ are automatically read
--    (files in after/ are not automatically read, but it is available to use for require)
-- The order in which dirs/files are read is determined by the runtimepath (:se rtp)
--
-- lazy.nvim does these steps: 
-- 1. All the plugins' init() functions are executed
-- 2. All plugins with lazy=false are loaded. This includes sourcing /plugin and /ftdetect files. (/after will not be sourced yet)
-- 3. All files from /plugin and /ftdetect directories in your rtp are sourced (excluding /after)
-- 4. All /after/plugin files are sourced (this includes /after from plugins)
-- Files from runtime directories are always sourced in alphabetical order.

-- This is how to print a message that will be logged in :messages
-- print("hello from init.lua")

require 'config.helpers'
require 'config.keybindings' -- set keymap leader before loading plugins
require 'config.settings'

-- load plugins
require 'config.lazy_bootstrap'
require("lazy").setup("plugins")

if os.getenv('INSTALL') then return end

require 'config.lsp'

if prequire('onedark') then
  vim.cmd('colorscheme onedark')
end

-- Load local customizations last from local.lua, if it exists.
-- This file is not checked into git.
-- It contains environment-specific customizations, such as site-specific colorchemes
local path = script_path() .. 'lua/config/local.lua'
if file_exists(path) then
  require 'config.local'
end
