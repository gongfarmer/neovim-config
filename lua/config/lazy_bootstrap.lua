-- Configure / install lazy.nvim
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

-- url form which to download lazy
local url = 'https://github.com/folke/lazy.nvim.git'
if vim.g.netapp then
  url = 'https://repomirror-rtp.eng.netapp.com/github-neovim/folke/lazy.nvim.git'
end

if not vim.loop.fs_stat(lazypath) then
  print("Bootstrapping lazy.nvim from " .. url)
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    url,
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

