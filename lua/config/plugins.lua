-- awesome plugins for neovom:
--   https://github.com/rockerBOO/awesome-neovim

vim.api.nvim_exec(
  -- automatically run PackerCompile whenever plugins.lua is written
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua call v:lua.compile_plugins()
    autocmd BufEnter plugins.lua nnoremap go :lua require'config.helpers'.open_github()<cr>
    autocmd BufEnter plugins.lua nnoremap gf :lua require'config.helpers'.open_config()<cr>
  augroup end
]],
  false
)

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

-- customize config of packer before #startup. Can be deleted when no customizations are wanted
require("packer").init({
  log = { level = 'debug' }
})

return require("packer").startup(function()

  local Use = function(plugin)
    local plugin_name = plugin
    if type(plugin) == "table" then plugin_name = plugin[1] end

    local filename = string.gsub(plugin_name, '.*/' , '')
    filename = filename:gsub('%.nvim', '')

    local config_cmd = ('pcall(require, "config/plugins/%s")'):format(filename)

    if type(plugin) == "table" then
      plugin.config = config_cmd
      use(plugin)
    else
      use { plugin, config = config_cmd }
    end
  end

  local colorscheme = "onedark.nvim"

  -- Color schemes
  use("navarasu/onedark.nvim")
  use("overcache/NeoSolarized")
  use("folke/tokyonight.nvim")
  use("catppuccin/nvim")
  use("rmehri01/onenord.nvim")
  use("savq/melange")
  use("jacoborus/tender.vim")

  -- Package manager
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim")

  use{"kyazdani42/nvim-web-devicons", config = function()
    require('nvim-web-devicons').setup {
      override = {
        rb = {
          icon = "",
          color = '#ff5f5f',
          name = "Rb"
        }
      },
      default = true;
    }
  end}

  -- use({ "norcalli/nvim-terminal.lua", config = 'require"terminal".setup()' })

  --  use({"folke/which-key.nvim", cmd = 'WhichKey'})
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- === tpope ===
  use("tpope/vim-unimpaired")
  use("tpope/vim-fugitive")
  -- use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("tpope/vim-abolish")
  use("tpope/vim-rails")

  -- === DAP ===
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "Pocco81/DAPInstall.nvim"

  -- === LSP ===

  use "neovim/nvim-lspconfig"
  use "glepnir/lspsaga.nvim"
  use { -- group of related plugins. Order is not important here, but setup() order is important
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim", -- makes NullLs install plugins through mason
  }


  -- == complete ==

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use('hrsh7th/nvim-cmp')

  -- === TreeSitter ===
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("nvim-treesitter/playground")

  Use({ "nvim-treesitter/nvim-treesitter"})

  Use({ "windwp/nvim-autopairs"})

  -- TODO: this doesn't seem to do anything.  Delete?
  use({
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Fraser: don't remap c-l. I like the default.
--      map("n", "<c-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
--      map("n", "<c-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
--      map("n", "<c-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
--      map("n", "<c-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
    end,
  })

  use({
    "mg979/vim-visual-multi",
    config = function()
      vim.cmd([[
      let g:VM_Mono_hl   = 'Visual'
      let g:VM_Extend_hl = 'WildMenu'
      let g:VM_Cursor_hl = 'Visual'
      let g:VM_Insert_hl = 'IncSearch'

      let g:VM_highlight_matches = 'red'
      let g:VM_leader = '<space>'
      let g:VM_maps = {}
      let g:VM_maps['Find Under']         = '<C-d>'
      let g:VM_maps['Find Subword Under'] = '<C-d>'

      let g:VM_maps['Add Cursor Down']             = '<C-U>'
      let g:VM_maps['Visual Cursors']              = '<space>'
      let g:VM_maps['Switch Mode']                 = 'v'
      let g:VM_maps['Visual Regex']                = '/'

      " autocmd User visual_multi_start nnoremap <c-l> l
      " autocmd User visual_multi_start nnoremap <c-h> h
      " autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>
      " autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>
      ]])
    end,
  })

  use({
    "Arkham/nvim-miniyank",
    config = function()
      vim.cmd([[
      map p <Plug>(miniyank-autoput)
      map P <Plug>(miniyank-autoPut)
      map <silent><c-p> <Plug>(miniyank-cycle)
      map <silent><c-n> <Plug>(miniyank-cycleback)
      ]])
    end,
  })

  use({
    "AndrewRadev/splitjoin.vim",
    config = function()
      vim.g.splitjoin_ruby_curly_braces = 0
      vim.g.splitjoin_ruby_curly_braces = 0
      vim.g.splitjoin_ruby_hanging_args = 0
      vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    end,
  })

  Use "lewis6991/gitsigns.nvim"

  use 'nvim-telescope/telescope-fzy-native.nvim'
  use {'jvgrootveld/telescope-zoxide'}

  Use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } }
  })


  Use({"lukas-reineke/indent-blankline.nvim", after = colorscheme})
  use({"L3MON4D3/LuaSnip", config = "require 'config.plugins.luasnip'"})

  use("kevinhwang91/nvim-bqf")
  use({ "junegunn/fzf", run = ":call fzf#install()", cmd = 'FZF' })
  use({ "norcalli/nvim-colorizer.lua", config = 'require"colorizer".setup()' })
  use{"jbyuki/one-small-step-for-vimkind", opt = true}

  use({
    "mhartington/formatter.nvim",
    cmd = "Format",
    config = function()
      require("formatter").setup({
        logging = false,
        log_level = vim.log.levels.INFO,
        filetype = {
          ruby = {
            require('formatter.filetypes.ruby').rubocop
          },
          sql = {
            function()
              local formaters = {
                { exe = 'pg_format', args = { '-', '-W', '5' }, stdin = true },
                { exe = "sqlformat", args = { "-", '-k', 'upper', '-a' }, stdin = true }
              }
              print('Select formatter (1) pg_format, (2) sqlformat:')
              local nr = vim.fn.nr2char(vim.fn.getchar())
              return formaters[tonumber(nr)]
            end
          },
          lua = {
            function()
              return { exe = "stylua", args = { "-" }, stdin = true }
            end,
          },
        },
      })
    end,
  })

  -- === statusline ===
  -- use {'glepnir/galaxyline.nvim', config = 'require"config.spaceline"'}
  use {'konapun/vacuumline.nvim',
  requires = {
    'glepnir/galaxyline.nvim', branch = 'main',
    'kyazdani42/nvim-web-devicons', opt = true
  },
  -- Add this line to use defaults; otherwise, call `setup` with your config as described below wherever you configure your plugins
  config = function() require('vacuumline').setup({
    --    theme = require('vacuumline.theme.one-dark')
    theme = require('vacuumline.theme.nord')
  }) end
} 
-- use {
--   'nvim-lualine/lualine.nvim',
--   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
-- }

use {
  "folke/trouble.nvim",
  cmd = 'Trouble',
  after = "telescope.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup { }

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
}

use { 'akinsho/nvim-toggleterm.lua', keys = [[<c-\\>]], config = function()
  require("toggleterm").setup {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    direction = 'vertical'
  }

  vim.g.terminal_color_8 = '#595959'
  vim.cmd 'tnoremap <c-]> <c-\\><c-n>'

  require 'config.plugins.nvim-toggleterm'
end}

use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }

-- winbar
-- * json: show json path at top of screen
-- * code: show current method / class context
use { 'phelipetls/jsonpath.nvim' }
use { 'fgheng/winbar.nvim', config = 'require"winbar".setup({})' }
use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
}


-- harpoon
-- Switch between a small set of numbered buffers easily
--
use { 'ThePrimeagen/harpoon' }

-- aerial - sidebar of all functions in the file
use {
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
}


use {'thinca/vim-quickrun', cmd = 'QuickRun'}
-- use "nathom/filetype.nvim"
-- use 'simrat39/symbols-outline.nvim'
use { 'sindrets/diffview.nvim', config = 'require"diffview".setup()', cmd = 'DiffviewOpen' }

-- Use { 'sidebar-nvim/sidebar.nvim', branch = "dev" }
-- Use { 'anuvyklack/pretty-fold.nvim', requires = 'anuvyklack/nvim-keymap-amend' }
Use 'rlane/pounce.nvim'
use {"elihunter173/dirbuf.nvim", cmd = 'Dirbuf'}
-- use { "natecraddock/workspaces.nvim", config = "require'workspaces'.setup()" }
-- use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }
-- use {"j-hui/fidget.nvim", config = "require'fidget'.setup{}" }
use {'hoschi/yode-nvim', disable = true}
use { 'mbbill/undotree', cmd = 'UndotreeToggle'}


-- file browser
use { "luukvbaal/nnn.nvim", config = 'require"nnn".setup()' }

use {'dstein64/vim-startuptime', opt = true}
use {'onsails/lspkind-nvim'}

Use { 'abecodes/tabout.nvim', after = {'nvim-cmp'}}

-- Code testing
use({
  'nvim-neotest/neotest',
  requires = {
    "nvim-neotest/neotest-plenary",
    "nvim-treesitter/nvim-treesitter",
    'olimorris/neotest-rspec',
    --     'antoinemadec/FixCursorHold.nvim',
  },
})


-- highly experimental plugin for replacing the UI used by lsp for messages, cmdline and popupmenu
use({
  "folke/noice.nvim",
  config = function()
    require("noice").setup()
  end,
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
})

-- Allow nvim to copy to clipboard over an ssh session.
-- Requirements:
--   configure terminal to support term instruction osc52 (google "iterm2 osc52)
--   possibly need to enable X11 forwarding on your ssh connection?  Unsure
use 'ojroques/vim-oscyank'

-- use { '~/projects/dig.nvim', config = ' dig = require"dig".debug' }

Use {'kylechui/nvim-surround'}
Use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
use { 'kkoomen/vim-doge', run = function() vim.fn['doge#install']() end  }
use {'stevearc/dressing.nvim', config = "require'dressing'.setup()" }


-- neogit - a git interface, similar to vim-fugitive but in lua and intends to clone magit
use {
  'TimUntersberger/neogit',
  requires = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim'
  }
}

end)
