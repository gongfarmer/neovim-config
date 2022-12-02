local function keybindings(bufnr)
  local function key_map(m, r, l)
    vim.api.nvim_buf_set_keymap(bufnr, m, r, l, { noremap = true, silent = true })
  end

  key_map("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")

  vim.cmd "command! Rename Lspsaga rename"


-- Fraser: these cause an error
--  key_map('n', '<c-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<cr>')
--  key_map('n', '<c-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')

  -- key_map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  -- key_map("n", "g<c-]>", "<Cmd>Lspsaga preview_definition<CR>")

  -- key_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  -- key_map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  -- key_map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  -- key_map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")

  -- key_map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- key_map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  -- key_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
end

local function highlights(client)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
    [[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
    false
    )
  end
end

return {
  keybindings = keybindings,
  highlights = highlights
}
