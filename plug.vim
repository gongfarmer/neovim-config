if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'

" Plug 'tomasr/molokai'
" Plug 'morhetz/gruvbox'
" Plug 'nightsense/snow'
" Plug 'mcchrish/nnn.vim'
" Plug 'ngmy/vim-rubocop'
" Plug 'kien/ctrlp.vim'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-abolish'
" Plug 'itspriddle/vim-shellcheck'
" Plug 'vim-airline/vim-airline'
" Plug 'embark-theme/vim', { 'as': 'embark' }

if has("nvim")
  Plug 'overcache/NeoSolarized'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
call plug#end()
