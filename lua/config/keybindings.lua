-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- ===== vim-projectionist
-- :A    move between source file and its rspec test file

-- ===== vim-unimpaired
--[[
  ]q    :cnext
  [q    :cprevious
  [a    :next
  [a    :previous
  [os   :set spell
  ]os   :set nospell
  yos   :set invspell
  [x    decode xml
  ]x    encode xml
  [n    visit next file in dir
  ]n    visit previous file in dir
]]--

-- ===== Random useful commands
--[[
  :nmap           list normal mode key mappings
  :verbose nmap   list normal mode key mappings, and where they were last defined
  :vmap           list visual mode key mappings
  :imap           list insert mode key mappings
--]]

-- ===== Telescope
-- see lua/plugins/telescope.lua

-- find lua/vim files in my nvim configuration dir
vim.keymap.set('n', '<space>oq', function()
  require'finders'.find {
    cwd = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h'),
    pattern = "(lua|vim)$"
  }
end)

-- LSP diagnostic keymaps
-- see ls.lua for more key mappings
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- show Aerial sidebar (code outline)
vim.cmd('nnoremap <leader>a <cmd>AerialToggle!<CR>')

-- ===== nnn
-- Used for looking at files in the local buffer's dirpath.
-- For finding files from the editor's working dir, use :Telescope find_files
--  The %:p:h argument makes it open at the dirname of the file in the active buffer
vim.cmd('nnoremap ,sf <cmd>NnnPicker %:p:h<CR>') -- 'see files' in floating window
vim.cmd('nnoremap ,fi <cmd>NnnExplorer %:p:h<CR>') -- list files in sidebar
vim.cmd('tnoremap <C-A-p> <cmd>NnnPicker<CR>')
vim.cmd('tnoremap <C-A-n> <cmd>NnnExplorer<CR>')
vim.cmd('nnoremap <C-A-n> <cmd>NnnExplorer %:p:h<CR>')

-- ===== Package management
vim.keymap.set('n', ',pu', '<cmd>Lazy update<cr>')

-- open my keybindings file
vim.cmd('nnoremap ,k <cmd>edit ~/.config/nvim/lua/config/keybindings.lua<CR>')

-- I always mistype :w as :W, which opens :WhichKey instead of saving
vim.cmd('cab W w')

-- F1 : alternate 'esc'
vim.cmd('map <F1> <ESC>')
vim.cmd('imap <F1> <ESC>')
vim.cmd('cmap <F1> <ESC>')

-- Abbreviations
vim.cmd('iab YDT <C-R>=strftime("%Y-%m-%d")<CR>')
vim.cmd('iab YDTT <C-R>=strftime("%F %H:%M:%S")<CR>')

vim.cmd('iab alos      also')
vim.cmd('iab aslo      also')
vim.cmd('iab bianry    binary')
vim.cmd('iab bianries  binaries')
vim.cmd('iab charcter  character')
vim.cmd('iab charcters characters')
vim.cmd('iab exmaple   example')
vim.cmd('iab exmaples  examples')
vim.cmd('iab shoudl    should')
vim.cmd('iab seperate  separate')
vim.cmd('iab teh       the')
vim.cmd('iab THe       The')
vim.cmd('iab tpyo      typo')
vim.cmd('iab THis      This')

-- source my vim config
vim.keymap.set('n', '<leader>sv', ':luafile $MYVIMRC<CR>')

-- Make C-a, C-e, C-k work (emacs-style) while entering cmds at the :
vim.cmd('cnoremap <C-a> <Home>')
vim.cmd('cnoremap <C-e> <End>')
vim.cmd('cnoremap <C-k> <C-\\>e strpart(getcmdline(), 0, getcmdpos()-1)<CR>')
vim.keymap.set('c', '<c-b>', '<left>')
vim.keymap.set('c', '<c-f>', '<right>')

-- emacs-style bindings in insert mode too
vim.keymap.set('i', '<c-a>', '<home>')
vim.keymap.set('i', '<c-e>', '<end>')

vim.cmd 'command! CopyAbsolutePath let @+ = expand("%:p")'
vim.keymap.set('n', 'cP', ':CopyAbsolutePath<cr>')

vim.cmd 'command! CopyPath let @+ = expand("%")'
vim.keymap.set('n', 'cp', ':CopyPath<cr>')

-- re-select the last visual selection
vim.keymap.set('n', '<leader>v', '`[v`]')

-- start/stop showing those colored indentation guide lines
vim.cmd('nnoremap ,i <cmd>IndentBlanklineToggle<cr>')
