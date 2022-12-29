require("nvim-treesitter.configs").setup({
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'cpp', 'go', 'lua', 'ruby', 'help' },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false,
  },
  highlight = {
    enable = true,
    custom_captures = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
})

local query = [[
[
(atx_heading)
(setext_heading)
] @text.title

(code_fence_content) @none

[
(indented_code_block)
(fenced_code_block)
(code_span)
] @text.literal


(emphasis) @text.emphasis
(strong_emphasis) @text.strong

(link_destination) @text.uri

(link_text) @text.reference

(thematic_break) @text.title

[
(list_marker_plus)
(list_marker_minus)
(list_marker_star)
(list_marker_dot)
(list_marker_parenthesis)
] @punctuation.special

[
(backslash_escape)
(hard_line_break)
] @string.escape
]]

require("vim.treesitter.query").set_query("markdown", "highlights", query)

vim.cmd [[hi TSTitle guifg=#e5c07b gui=bold]]
vim.cmd [[hi TSURI guifg=#61afef gui=none]]
vim.cmd [[hi TSPunctSpecial guifg=#c678dd gui=none]]
vim.cmd [[hi TSTextReference guifg=#e86671 gui=none]]

vim.cmd [[hi TSStrong gui=bold]]
vim.cmd [[hi TSEmphasis gui=italic]]
