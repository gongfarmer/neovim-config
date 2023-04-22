-- Treesitter - Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { 'cpp', 'go', 'json', 'lua', 'ruby', 'vimdoc' },
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

      -- nvim-ts-rainbow: color matching parens the same color
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, -- list of languages for which to disable this plugin
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags [boolean or table\
        max_file_lines = nil, -- Do not enable for files with more than n lines [int]
        -- colors = {}. -- table of hex strings
        -- termcolors = {}. -- table of colour name strings
      }

    })

    vim.cmd [[hi TSTitle guifg=#e5c07b gui=bold]]
    vim.cmd [[hi TSURI guifg=#61afef gui=none]]
    vim.cmd [[hi TSPunctSpecial guifg=#c678dd gui=none]]
    vim.cmd [[hi TSTextReference guifg=#e86671 gui=none]]

    vim.cmd [[hi TSStrong gui=bold]]
    vim.cmd [[hi TSEmphasis gui=italic]]
  end
}

