-- key bindings for harpoon, a buffer switching plugin

-- ,m : add current to mark list
vim.cmd('nnoremap <leader>m <cmd>lua require("harpoon.mark").add_file()<CR>')
vim.cmd('nnoremap <C-e> <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')

-- hjkl: easy to access because they are the RHS home row keys.
vim.cmd('nnoremap <C-h> <cmd>lua require("harpoon.ui").nav_file(1)<CR>')
vim.cmd('nnoremap <C-j> <cmd>lua require("harpoon.ui").nav_file(2)<CR>')
vim.cmd('nnoremap <C-k> <cmd>lua require("harpoon.ui").nav_file(3)<CR>')

-- don't remap C-l, it must redraw and clear nohlsearch
-- vim.cmd('nnoremap <C-l> <cmd>lua require("harpoon.ui").nav_file(4)<CR>')
