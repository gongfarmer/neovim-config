-- Structuring your plugins:
--   https://github.com/folke/lazy.nvim#-structuring-your-plugins

-- return a hash of plugins to load.
-- this will be merged with other configuration files in lua/plugins.
return {
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-abolish',
  'tpope/vim-projectionist', -- adds :A to move between source and test file

  -- neogit - a git interface, similar to vim-fugitive but in lua and intends to clone magit
  {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    }
  },

  --  LSP
  -- FIXME: dropped lspsaga since it is no longer in kickstart.  Good idea???
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jayp0521/mason-null-ls.nvim', -- makes NullLs install plugins through mason

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

-- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip' },
  },

  -- show pending keybinds
  { 'folke/which-key.nvim', opts = {} },
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Color schemes
  { 'navarasu/onedark.nvim', lazy=true },
  { 'overcache/NeoSolarized', lazy=true },
  { 'folke/tokyonight.nvim', lazy=true },
  { 'catppuccin/nvim', lazy=true },
  { 'rmehri01/onenord.nvim', lazy=true },
  { 'savq/melange', lazy=true },
  { 'jacoborus/tender.vim', lazy=true },

  -- icons
  {
    'kyazdani42/nvim-web-devicons',
    opts = {
      override = {
        rb = {
          icon = "",
          color = '#ff5f5f',
          name = "Rb"
        }
      },
      default = true
    }
  },

  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    opts = {
      options = {
        theme = 'seoul256',
--      theme  = "powerline_dark",
--      theme  = "horizon",
--      component_separators = '|',
--      section_separators = '',
      },
    },
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- Better quick-fix window
  'kevinhwang91/nvim-bqf',

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
    },
    cmd = { "Telescope", "Tel" }, -- lazy loads on these commands
    keys = { "<leader>f" }, -- lazy loads on this pattern
    config = function()
      local telescope = require("telescope")
      telescope.setup({})

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup()
      npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
    end
  },

  -- FIXME: dropped "Arkham/nvim-miniyank",
  -- FIXME: dropped "AndrewRadev/splitjoin.vim",
  -- FIXME: dropped "mhartington/formatter.nvim",

  -- Colorize background color of color names/hex codes
  'norcalli/nvim-colorizer.lua',

  {
    'folke/trouble.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    cmd = 'Trouble',
    after = "telescope.nvim",
    config = function()
      require("trouble").setup {}
      local trouble = require("trouble.providers.telescope")
      local telescope = require("telescope")
      telescope.setup {
        defaults = {
          mappings = {
            i = { ["<c-e>"] = trouble.open_with_trouble },
            n = { ["<c-e>"] = trouble.open_with_trouble },
          },
        },
      }
    end
  },


  -- Show code context in top bar
  'fgheng/winbar.nvim',
  'phelipetls/jsonpath.nvim',
  {
      "SmiteshP/nvim-navic",
      dependencies = "neovim/nvim-lspconfig"
  },

  -- Code testing
  {
    'nvim-neotest/neotest',
    dependencies = {
      "nvim-neotest/neotest-plenary",
      "nvim-treesitter/nvim-treesitter",
      'olimorris/neotest-rspec',
      --     'antoinemadec/FixCursorHold.nvim',
    },
    keys = {
      { '<leader>t', '<cmd> Neotest.run.run()<CR>', desc = 'run nearest tests' },
      { '<leader>tf', '<cmd> Neotest.run.run(vim.fn.expand("%%"))<CR>', desc = 'run test file' },
      { '<leader>tl', '<cmd> Neotest.run.run_last()<CR>', desc = 'run last' },
      { '<leader>ts', '<cmd> Neotest.summary.open()<CR>', desc = 'show test summary' },
    }
  },

  -- File manager
  {
    'luukvbaal/nnn.nvim',
    opts = { replace_netrw = "picker" },
  },

  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },

  -- aerial - code outline sidebar
  {
    'stevearc/aerial.nvim',
    config =
      function() require('aerial').setup({
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
        end
      })
      end
  },

  -- use colors to visually link parens with their match
  'mrjones2014/nvim-ts-rainbow',

  'dstein64/vim-startuptime',
  'ThePrimeagen/harpoon',
  'onsails/lspkind-nvim',
  'kylechui/nvim-surround',

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && yarn install',
    cmd = 'MarkdownPreview'
  },

  -- Allow nvim to copy to clipboard over an ssh session.
  -- Requirements:
  --   configure terminal to support term instruction osc52 (google "iterm2 osc52)
  --   possibly need to enable X11 forwarding on your ssh connection?  Unsure
  -- FIXME not working yet
  'ojroques/vim-oscyank',

  -- golang
  'ray-x/go.nvim',
  'ray-x/guihua.lua',

  -- FIXME: where to put this lang-specific configuration?
--  local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {}),
--  vim.api.nvim_create_autocmd("BufWritePre", {
--    pattern = "*.go",
--    callback = function()
--      require('go.format').goimport()
--    end,
--    group = format_sync_grp,
--  }),
--  vim.cmd('au BufNewFile,BufRead *.go set nolist')
--
--  -- why did I do this??
--  vim.opt.timeout = true


  -- FIXME: kickstart.nvim contains configuration for autoformat on save which I have omitted.
}
