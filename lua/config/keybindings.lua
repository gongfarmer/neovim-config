vim.cmd "let g:mapleader=','"

-- ====== Telescope

-- find lua/vim files in my nvim configuration dir
vim.keymap.set('n', '<space>oq', function()
  require'finders'.find {
    cwd = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h'),
    pattern = "(lua|vim)$"
  }
end)

-- Packer
vim.keymap.set('n', '<Leader>pu', '<cmd> PackerUpdate<cr>')

-- Telescope
-- (use C-n and C-p to move selection up or down in Telescope)
-- keymaps are named after the shortest set of chars describing the telescope command
-- To see all available pickers: :Telescop builtin
vim.keymap.set('n', '<space>b', '<cmd> Telescope buffers<cr>')
vim.keymap.set('n', '<space>ff', '<cmd> Telescope find_files<cr>')
--vim.keymap.set('n', '<space>ff', require'finders'.find) -- looks the same as Telescope find_files
vim.keymap.set('n', '<space>g', require'finders'.git) -- better than Telescope git_files
vim.keymap.set('n', '<space>h', "<cmd>Telescope help_tags<cr>")
vim.keymap.set('n', '<space>k', "<cmd>Telescope keymaps<cr>")
vim.keymap.set('n', '<space>ld', '<cmd> Telescope lsp_definitions<cr>') -- show where variable is defined
vim.keymap.set('n', '<space>lg', "<cmd> Telescope live_grep<cr>")
vim.keymap.set('n', '<space>lr', '<cmd> Telescope lsp_references<cr>') -- show callers of this method
--vim.keymap.set('n', '<space>of', require'finders'.grep) -- live grep alternative? doesn't work
vim.keymap.set('n', '<space>z', "<cmd>Telescope zoxide list<cr>")
vim.keymap.set('n', '<space><c-o><c-o>', "<cmd>Telescope resume<cr>") -- re-open the previous picker in same state
vim.keymap.set('n', '<space>o<c-o>', "<cmd>Telescope resume<cr>")

--- Lspsaga (stolen from glepnir/nvim)
vim.keymap.set('n', '[e', '<cmd> Lspsaga diagnostic_jump_next<cr>')
vim.keymap.set('n', ']e', '<cmd> Lspsaga diagnostic_jump_prev<cr>')
vim.keymap.set('n', '[c', '<cmd> Lspsaga show_cursor_diagnostics<cr>')
vim.keymap.set('n', '[l', '<cmd> Lspsaga show_line_diagnostics<cr>') -- was L, reclaimed for end-of-line
vim.keymap.set('n', 'K',  '<cmd> Lspsaga hover_doc<cr>')
vim.keymap.set('n', 'ga', '<cmd> Lspsaga code_action<cr>')
vim.keymap.set('n', 'gd', '<cmd> Lspsaga peek_definition<cr>')
vim.keymap.set('n', 'gs', '<cmd> Lspsaga signature_help<cr>')
vim.keymap.set('n', 'gr', '<cmd> Lspsaga rename<cr>')
vim.keymap.set('n', 'gh', '<cmd> Lspsaga lsp_finder<cr>')
vim.keymap.set('n', '<Leader>o', '<cmd> LSoutlineToggle<cr>')
-- ALso remember to check :LspLog once in a while

-- start/stop showing those colored indentation guide lines
vim.cmd('nnoremap ,i <cmd>IndentBlanklineToggle<cr>')

-- show Aerial sidebar (shows functions in the file)
vim.cmd('nnoremap <leader>a <cmd>AerialToggle!<CR>')

-- nnn
--  The %:p:h argument makes it open the dirname of the file in the active buffer
vim.cmd('nnoremap sf <cmd>NnnPicker %:p:h<CR>') -- 'see files'
vim.cmd('nnoremap fi <cmd>NnnExplorer %:p:h<CR>') -- same as above
vim.cmd('tnoremap <C-A-p> <cmd>NnnPicker<CR>')
vim.cmd('tnoremap <C-A-n> <cmd>NnnExplorer<CR>')
vim.cmd('nnoremap <C-A-n> <cmd>NnnExplorer %:p:h<CR>')

-- neotest
-- see neotest.lua setup/summarymappings for keymaps to use inside the neotest window
vim.cmd('nnoremap <leader>t <cmd>lua require("neotest").run.run()<CR>') -- run nearest test
vim.cmd('nnoremap <leader>tf <cmd>lua require("neotest").run.run(vim.fn.expand("%%"))<CR>') -- test file
vim.cmd('nnoremap <leader>tl <cmd>lua require("neotest").run.run_last()<CR>')
vim.cmd('nnoremap <leader>ts <cmd>lua require("neotest").summary.open()<CR>')

-- run entire test suite
vim.keymap.set('n', '<leader>ta', function()
  local neotest = require('neotest')
  for _, adapter_id in ipairs(neotest.run.adapters()) do
    neotest.run.run({ suite = true, adapter = adapter_id })
  end
end)

-- open my keybindings file
vim.cmd('nnoremap ,k <cmd>edit ~/.config/nvim/keybindings.txt<CR>')
vim.cmd('nnoremap ,K <cmd>edit ~/.config/nvim/lua/config/keybindings.lua<CR>')

vim.cmd([[nmap <leader>t <Plug>PlenaryTestFile]])

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
