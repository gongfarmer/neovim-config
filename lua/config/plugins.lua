-- install packer if needed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
ensure_packer()


-- bail out if packer not installed
if not prequire('packer') then return end

-- automatically run PackerCompile whenever plugins.lua is written
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

-- customize config of packer before #startup. Can be deleted when no customizations are wanted
-- require("packer").init({
--   log = { level = 'debug' }
-- })

return require("packer").startup(function(use)

  -- "use" the plugin and then source its configuration file in lua/config/plugins/.
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

  -- golang
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'
  local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      require('go.format').goimport()
    end,
    group = format_sync_grp,
  })
  require('go').setup()
  vim.cmd('au BufNewFile,BufRead *.go set nolist')

  vim.opt.timeout = true
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
  -- use("tpope/vim-surround")
  use("tpope/vim-abolish")
  use("tpope/vim-fugitive")
  use("tpope/vim-projectionist") -- adds :A to move between source and test file
                                 -- needs .projections.json in project root to define mapping between source and test
  use("tpope/vim-rails")
  use("tpope/vim-repeat")
  use("tpope/vim-unimpaired")

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
    "j-hui/fidget.nvim", -- status updates for lsp
    "folke/neodev.nvim", -- additional lua configuration for plugin writers
  }

  -- == completion ==
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- === TreeSitter ===
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("nvim-treesitter/playground")


  Use({ "windwp/nvim-autopairs"})

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


  use 'lukas-reineke/indent-blankline.nvim'
  use({"L3MON4D3/LuaSnip", config = "require 'config.plugins.luasnip'"})

  use("kevinhwang91/nvim-bqf")
  use({ "junegunn/fzf", run = ":call fzf#install()", cmd = 'FZF' })
  use({ "norcalli/nvim-colorizer.lua", config = 'require("colorizer").setup()' })
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
   config = function() require('vacuumline').setup({
     --    theme = require('vacuumline.theme.one-dark')
     theme = require('vacuumline.theme.nord')
   }) end
 }
  require('vacuumline').setup({ theme = require('vacuumline.theme.nord') })

  -- trouble - A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
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
  use { 'fgheng/winbar.nvim' }
  use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }

  -- harpoon - switch between a small set of numbered buffers easily
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
  use { 'sindrets/diffview.nvim', config = 'require"diffview".setup()', cmd = 'DiffviewOpen' }

  use {"elihunter173/dirbuf.nvim", cmd = 'Dirbuf'}
  use {'hoschi/yode-nvim', disable = true}
  use { 'mbbill/undotree', cmd = 'UndotreeToggle'}

  -- file browser
  use { "luukvbaal/nnn.nvim", config = 'require"nnn".setup({replace_netrw = "picker"})' }

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

  Use {'kylechui/nvim-surround'}
  use {'stevearc/dressing.nvim', config = "require'dressing'.setup()" }

  -- neogit - a git interface, similar to vim-fugitive but in lua and intends to clone magit
  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    }
  }

end) -- end packer startup
