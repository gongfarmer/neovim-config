vim.cmd "let g:mapleader=','"

-- ====== Telescope

-- find lua/vim files in my nvim configuration dir
vim.keymap.set('n', '<space>oq', function()
  require'finders'.find {
    cwd = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h'),
    pattern = "(lua|vim)$"
  }
end)

-- keymaps for telescope
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

-- DISABLED because I want the stock meaning of ';' back
-- vim.cmd('nnoremap ;; <cmd>NnnExplorer %:p:h<cr>')

--vim.keymap.set('n', '<c-q>', require'scripts'.quickfix_toggle)


-- start/stop showing those colored indentation guide lines
vim.cmd('nnoremap ,<leader> <cmd>IndentBlanklineToggle<cr>')

-- show Aerial sidebar (shows functions in the file)
vim.cmd('nnoremap <leader>a <cmd>AerialToggle!<CR>')

-- nnn
--  The %:p:h argument makes it open the dirname of the file in the active buffer
vim.cmd('nnoremap sf <cmd>NnnPicker %:p:h<CR>') -- 'see files'
vim.cmd('nnoremap fi <cmd>NnnExplorer %:p:h<CR>') -- same as above
vim.cmd('tnoremap <C-A-p> <cmd>NnnPicker<CR>')
vim.cmd('tnoremap <C-A-n> <cmd>NnnExplorer<CR>')
vim.cmd('nnoremap <C-A-n> <cmd>NnnExplorer %:p:h<CR>')

-- open my keybindings file
vim.cmd('nnoremap ,k <cmd>edit ~/.config/nvim/keybindings.txt<CR>')

-- Make C-a, C-e, C-k work (emacs-style) while entering cmds at the :
vim.cmd('cnoremap <C-a> <Home>')
vim.cmd('cnoremap <C-e> <End>')
vim.cmd('cnoremap <C-k> <C-\\>e strpart(getcmdline(), 0, getcmdpos()-1)<CR>')

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
-- The rest of these come from rafcamlet, watch out!
-- FIXME: decide if there are any gems in here worth keeping

-- FRASER: this is confusing, it swaps ; and : WTF!!!
-- vim.keymap.set('n', ';', ':')
-- vim.keymap.set('n', "'", '`')
-- vim.keymap.set('n', ':', ';')
-- vim.keymap.set('v', ':', ';')
-- vim.keymap.set('v', ';', ':')

-- vim.keymap.set('i', 'kj', '<esc>`^')
-- 
-- vim.keymap.set('n', "<enter>", ":put =''<cr>")
-- vim.keymap.set('c', '<enter>', '<cr>')
-- -- autocmd FileType qf nvim.keymap.set('', ' <buffer> <cr> <cr>
-- 
-- vim.keymap.set('n', 'j', 'gj')
-- vim.keymap.set('n', 'k', 'gk')
-- vim.keymap.set('v', 'j', 'gj')
-- vim.keymap.set('v', 'k', 'gk')
-- 
-- vim.keymap.set('n', '<leader>ev', ':e $MYVIMRC<CR>')
-- vim.keymap.set('n', '<leader>sv', ':luafile $MYVIMRC<CR>')
-- 
-- vim.keymap.set('n', '/', '/\\v')
-- vim.keymap.set('n', '?', '?\\v')
-- 
-- -- " Find merge conflict markers
-- vim.keymap.set('n', '<leader>fc', '/\v^[<|=>]{7}( .*|$)<CR>')
-- 
-- -- " Replace macro for all lines in paragraph
-- vim.keymap.set('n', '<Leader>@', 'vip:normal @q<cr>')
-- 
-- -- Format paragraph
-- vim.keymap.set('n', 'Q', 'mp=ip`p')
-- vim.keymap.set('v', 'Q', '=')
-- 
-- -- repeat last action for selected lines
-- vim.keymap.set('v', '.',  ':normal .<CR>')
-- -- repeat q macro for selected lines
-- vim.keymap.set('v', '@', ':normal! @q<CR>')

-- -- tab mapping'',
-- vim.keymap.set('n', '<space>1', '1gt')
-- vim.keymap.set('n', '<space>2', '2gt')
-- vim.keymap.set('n', '<space>3', '3gt')
-- vim.keymap.set('n', '<space>4', '4gt')
-- vim.keymap.set('n', '<space>5', '5gt')
-- vim.keymap.set('n', '<space>6', '6gt')
-- vim.keymap.set('n', '<space>7', '7gt')
-- vim.keymap.set('n', '<space>8', '8gt')
-- vim.keymap.set('n', '<space>9', '9gt')
-- vim.keymap.set('n', '<space>0', ':tablast<CR>')
-- vim.keymap.set('n', '<c-t><c-t>', ':tabnew<CR>:tabmove<cr>')
-- vim.keymap.set('n', '<c-t><cr>', '<c-w>T')
-- vim.keymap.set('n', '<c-t><c-q>', ':tabc<cr>')
-- 
-- -- highlight current word without search for next
-- vim.keymap.set('n', '*', ':set hls<cr>*``')
-- 
-- -- moving aroung in command mode
-- vim.keymap.set('c', '<c-b>', '<left>')
-- vim.keymap.set('c', '<c-f>', '<right>')
-- vim.keymap.set('c', '<c-a>', '<home>')
-- vim.keymap.set('c', '<c-0>', '<end>')
-- vim.keymap.set('c', '<c-x>', '<del>')
-- vim.keymap.set('c', '<c-v>', '<c-r>+')
-- vim.keymap.set('c', '<c-n>', '<down>')
-- vim.keymap.set('c', '<c-p>', '<up>')
-- vim.keymap.set('i', '<c-a>', '<home>')
-- vim.keymap.set('i', '<c-e>', '<end>')
-- 
-- vim.cmd 'command! CopyAbsolutePath let @+ = expand("%:p")'
-- vim.keymap.set('n', 'cP', ':CopyAbsolutePath<cr>')
-- 
-- vim.cmd 'command! CopyPath let @+ = expand("%")'
-- vim.keymap.set('n', 'cp', ':CopyPath<cr>')
-- 
-- vim.keymap.set('v', 'c', "_c")
-- 
-- local chars = { '_', '.', ':', ',', ';', '|', '/', '\\', '*', '+', '%', '`', '?' }
-- for _,char in ipairs(chars) do
--   vim.keymap.set({'x', 'o'}, "i" .. char, string.format(':<C-u>normal! T%svt%s<CR>', char, char), { noremap = true, silent = true })
--   vim.keymap.set({'x', 'o'}, "a" .. char, string.format(':<C-u>normal! F%svf%s<CR>', char, char), { noremap = true, silent = true })
-- end
-- 
-- vim.keymap.set('n', 'gp', '`[v`]')
-- vim.keymap.set('n', 'g>', '`[v`]>')
-- vim.keymap.set('n', 'g<', '`[v`]<')
-- vim.keymap.set('n', '[v', '`<')
-- vim.keymap.set('n', ']v', '`>')
