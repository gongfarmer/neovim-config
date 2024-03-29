require('indent_blankline').setup()

vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_char_highlight_list = {
  "IndentOne",
  "IndentTwo",
  "IndentThree",
  "IndentFour",
  "IndentFive",
  "IndentSix",
  "IndentSeven"
}

vim.g.indent_blankline_filetype_exclude = {
  "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
  "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
  "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
  "flutterToolsOutline", "" -- for all buffers without a file type
}

-- because lazy load indent-blankline so need readd this autocmd
vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')

-- Start with plugin disabled
-- Turn it on as needed using the key mapping
vim.cmd('let g:indent_blankline_enabled = v:false')

-- Reload my customized highlight groups when 'colorscheme' command is called.
-- Works around a bug where :colorscheme was changing all colors to grey.
vim.api.nvim_create_autocmd(
  {"ColorScheme"},
  {
    pattern = "*",
    callback = function()
      vim.cmd [[highlight IndentOne guifg=#E06C75 gui=nocombine]]
      vim.cmd [[highlight IndentTwo guifg=#E5C07B gui=nocombine]]
      vim.cmd [[highlight IndentThree guifg=#98C379 gui=nocombine]]
      vim.cmd [[highlight IndentFour guifg=#56B6C2 gui=nocombine]]
      vim.cmd [[highlight IndentFive guifg=#61AFEF gui=nocombine]]
      vim.cmd [[highlight IndentSix guifg=#C678DD gui=nocombine]]
      vim.cmd [[highlight IndentSeven guifg=#5C3D56 guibg=NONE gui=nocombine]]
    end
  }
)

-- Alternative cool looking color palettes

-- vim.cmd [[highlight IndentOne guifg=#BF616A guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentTwo guifg=#D08770 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentThree guifg=#EBCB8B guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentFour guifg=#A3BE8C guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentFive guifg=#5E81AC guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentSix guifg=#88C0D0 guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentSeven guifg=#B48EAD guibg=NONE gui=nocombine]]

-- vim.cmd [[highlight IndentOne guifg=#63363A guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentTwo guifg=#5C443D guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentThree guifg=#5C523D guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentFour guifg=#4B5C3D guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentFive guifg=#3D4B5C guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentSix guifg=#3D555C guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentSeven guifg=#5C3D56 guibg=NONE gui=nocombine]]
