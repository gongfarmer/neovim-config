function quickfix_toggle()
  local quickfix = false

  local tab = vim.api.nvim_get_current_tabpage()
  local wins = vim.api.nvim_tabpage_list_wins(tab)

  for _, v in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(v)
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if ft == "qf" then
      quickfix = true
    end
  end

  if quickfix then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end
