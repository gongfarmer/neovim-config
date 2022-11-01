require('pounce').setup {
  accept_keys = "JKLHNMUIOP",
  debug = false,
}

-- Fraser: needs special configuration because it defaults to mapping "s" to trigger it, which is super annoying
vim.cmd "nmap ,s <cmd>Pounce<CR>"
vim.cmd "vmap ,s <cmd>Pounce<CR>"
vim.cmd "omap ,gs <cmd>Pounce<CR>"
