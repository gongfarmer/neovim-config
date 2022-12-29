vim.opt.termguicolors = true                    -- enable 24 bit RGB color in the terminal
vim.opt.diffopt = 'filler,iwhite'               -- In diff mode, ignore whitespace changes and align unchanged lines
vim.opt.modeline = true                         -- turn on modeline
vim.opt.number = true                           -- show line numbers
vim.opt.showmode = true                         -- Show current mode down the bottom
vim.opt.showmatch = true                        -- highlight matching bracket
--vim.opt.lazyredraw = true                       -- redraw only when we need to.
vim.opt.linebreak = true                        -- Wrap lines at convenient points
vim.opt.backup = false                          -- prevent backup
vim.opt.swapfile = false                        -- prevent swapfile
vim.opt.writebackup = false                     -- prevent backup
vim.opt.scrolljump = 5                          -- Lines to scroll when cursor leaves screen
-- set backupdir=~/.backup,./.backup,/tmp         -- set backup directory
vim.opt.splitbelow = true                       -- set panel split position
vim.opt.splitright = true                       -- put new window to the right of the current one
vim.opt.foldlevelstart = 1                      -- start folding from specified level
vim.opt.iskeyword = vim.opt.iskeyword + '-'     -- add `-` character as part of words
-- set wrapmargin=2                             -- Wrap 2 characters from the edge of the window
vim.opt.fileignorecase = true                   -- case is ignored when using file names and directories
vim.opt.mouse = 'a'                             -- enable mouse
vim.opt.autoread = false                        -- disable file change detection
vim.o.breakindent = true                        -- wrapped lines will continue with same indent

-- Do not set this, it breaks noice
-- 2022-11-09 on neovim 0.9-dev
--- vim.opt.guicursor = ''                               -- reset cursor shape

-- cursorline: subtly brighten the line that the cursor is on
vim.opt.cursorline = true
vim.cmd [[highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40]]
vim.cmd [[highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=black]]
vim.cmd [[highlight CursorLineNr guifg=#e5c07b]] -- highlight the line number of the active line


-- Display extra whitespace
vim.opt.list = true
vim.opt.listchars = 'tab:»»,trail:·,nbsp:·'

-- Indentation
vim.opt.smartindent = true
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
vim.opt.tabstop=2
vim.opt.expandtab = true

-- turn on plugins and indentation based on filetype
-- filetype plugin on
-- filetype indent on

-- vim commands autocomplet
-- set wildmode=list:longest,full
vim.opt.wildignorecase = true -- case insensitive filename completion
vim.opt.wildoptions = 'pum'

--no error
vim.opt.errorbells = false

-- search options
vim.opt.ignorecase = true     -- Ignore case in search patterns
vim.opt.smartcase = true      -- Override ignorecase if the pattern contains upper case characters
vim.opt.incsearch = true

vim.opt.inccommand = 'nosplit' --Shows the effects of a substitution incrementally, as you type

vim.opt.clipboard:append('unnamedplus') -- integrate system clipboard

vim.opt.jumpoptions='stack'
vim.opt.signcolumn='yes'
vim.opt.updatetime = 250

vim.opt.shortmess:append "s"


vim.o.completeopt = 'menuone,noselect' -- set to have a better completion experience
-- use ripgrep
if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = 'rg -i --vimgrep $*'
  vim.opt.grepformat = '%f:%l:%c:%m'
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim.api.nvim_create_augroup('dynamic_smartcase', { clear = true })
-- vim.api.nvim_create_autocmd({
--   event = 'CmdLineEnter',
--   group = 'dynamic_smartcase',
--   callback = function() vim.opt.ignorecase = true end
-- })
-- vim.api.nvim_create_autocmd({
--   event = 'CmdLineEnter',
--   group = 'dynamic_smartcase',
--   callback = function() vim.opt.smartcase = true end
-- })


vim.api.nvim_create_augroup('highlight_yank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'highlight_yank',
  callback = function()
    vim.highlight.on_yank { higroup="Visual", timeout=250 }
  end
})

vim.api.nvim_create_augroup('help_autogroup', {})
vim.api.nvim_create_autocmd('BufEnter', {
  group = 'help_autogroup',
  callback = function()
    local buf = tonumber(vim.fn.expand('<abuf>'))

    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, 'filetype') == 'help' then
        vim.api.nvim_set_current_buf(buf)
        vim.cmd 'wincmd L'
        vim.cmd 'vertical resize 85'
      end
    end)
  end
})


local disabled_built_ins = {
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
