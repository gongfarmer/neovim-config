-- On startup:
-- 1. init.lua is read
-- 2. files in after/plugin/ are automatically read
--    (files in after/ are not automatically read, but it is available to use for require)
-- The order in which dirs/files are read is determined by the runtimepath (:se rtp)

-- # This is how to print a message that will be logged in :messages
-- print("hello from init.lua")

require 'config.helpers'
require "config.keybindings"
require "config.settings"
require "config.plugins" -- could eliminate this by moving plugin config files to after/plugin

if os.getenv('INSTALL') then return end

require "config.lsp"
require "config.dap"

if prequire('onedark') then
  vim.cmd('colorscheme onedark')
end

-- Load local customizations last from local.lua, if it exists.
-- This file is not checked into git.
-- It contains environment-specific customizations, such as different colorchemes for different sites.
path = script_path() .. 'lua/config/local.lua'
if file_exists(path) then
  require 'config.local'
end
