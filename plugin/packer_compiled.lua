-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/fraser/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/fraser/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/fraser/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/fraser/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/fraser/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim",
    url = "https://github.com/Pocco81/DAPInstall.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "require 'config.plugins.luasnip'" },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\nê\3\0\0\b\0\16\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  NeoSolarized = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/NeoSolarized",
    url = "https://github.com/overcache/NeoSolarized"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen" },
    config = { 'require"diffview".setup()' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dirbuf.nvim"] = {
    commands = { "Dirbuf" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/dirbuf.nvim",
    url = "https://github.com/elihunter173/dirbuf.nvim"
  },
  ["dressing.nvim"] = {
    config = { "require'dressing'.setup()" },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    config = { "\27LJ\2\ní\2\0\0\5\0\f\0\0254\0\3\0005\1\0\0005\2\1\0=\2\2\1>\1\1\0005\1\3\0005\2\4\0=\2\2\1>\1\2\0006\1\5\0'\3\6\0B\1\2\0016\1\a\0009\1\b\0019\1\t\0016\3\a\0009\3\b\0039\3\n\3B\3\1\0A\1\0\0026\2\v\0\18\4\1\0B\2\2\0028\2\2\0L\2\2\0\rtonumber\fgetchar\fnr2char\afn\bvim3Select formatter (1) pg_format, (2) sqlformat:\nprint\1\5\0\0\6-\a-k\nupper\a-a\1\0\2\bexe\14sqlformat\nstdin\2\targs\1\4\0\0\6-\a-W\0065\1\0\2\bexe\14pg_format\nstdin\0027\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\6-\1\0\2\bexe\vstylua\nstdin\2˘\1\1\0\b\0\18\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\0039\3\a\3=\3\b\0025\3\v\0004\4\3\0006\5\0\0'\a\t\0B\5\2\0029\5\n\5>\5\1\4=\4\f\0034\4\3\0003\5\r\0>\5\1\4=\4\14\0034\4\3\0003\5\15\0>\5\1\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\rfiletype\blua\0\bsql\0\truby\1\0\0\frubocop\29formatter.filetypes.ruby\14log_level\tINFO\vlevels\blog\bvim\1\0\1\flogging\1\nsetup\14formatter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  fzf = {
    commands = { "FZF" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["galaxyline.nvim"] = {
    config = { 'require"config.spaceline"' },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'pcall(require, "config/plugins/gitsigns")' },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'pcall(require, "config/plugins/indent-blankline")' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  melange = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/melange",
    url = "https://github.com/savq/melange"
  },
  neogit = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  neotest = {
    config = { 'pcall(require, "config/plugins/neotest")' },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-rspec"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/neotest-rspec",
    url = "https://github.com/olimorris/neotest-rspec"
  },
  ["nnn.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bnnn\frequire\0" },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nnn.nvim",
    url = "https://github.com/luukvbaal/nnn.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  nvim = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'pcall(require, "config/plugins/nvim-autopairs")' },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "tabout.nvim" },
    config = { 'require "config.plugins.nvim-cmp"' },
    loaded = true,
    only_config = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require"colorizer".setup()' },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-miniyank"] = {
    config = { "\27LJ\2\nÕ\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0≠\1    map p <Plug>(miniyank-autoput)\n    map P <Plug>(miniyank-autoPut)\n    map <silent><c-p> <Plug>(miniyank-cycle)\n    map <silent><c-n> <Plug>(miniyank-cycleback)\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-miniyank",
    url = "https://github.com/Arkham/nvim-miniyank"
  },
  ["nvim-surround"] = {
    config = { 'pcall(require, "config/plugins/nvim-surround")' },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\15\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµÊÃô\19ô≥Ê˛\3˚\1\1\0\4\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0'\1\t\0=\1\b\0006\0\6\0009\0\n\0'\2\v\0B\0\2\0016\0\0\0'\2\f\0B\0\2\1K\0\1\0#config.plugins.nvim-toggleterm\30tnoremap <c-]> <c-\\><c-n>\bcmd\f#595959\21terminal_color_8\6g\bvim\tsize\1\0\2\14direction\rvertical\17open_mapping\n<c-\\>\0\nsetup\15toggleterm\frequire\0" },
    keys = { { "", "<c-\\\\>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'pcall(require, "config/plugins/nvim-treesitter")' },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ufo"] = {
    config = { 'pcall(require, "config/plugins/nvim-ufo")' },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nê\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\arb\1\0\0\1\0\3\tname\aRb\ncolor\f#ff5f5f\ticon\bÓûë\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/one-small-step-for-vimkind",
    url = "https://github.com/jbyuki/one-small-step-for-vimkind"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["onenord.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/onenord.nvim",
    url = "https://github.com/rmehri01/onenord.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["pounce.nvim"] = {
    config = { 'pcall(require, "config/plugins/pounce")' },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/pounce.nvim",
    url = "https://github.com/rlane/pounce.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["splitjoin.vim"] = {
    config = { "\27LJ\2\n∑\1\0\0\2\0\5\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0002splitjoin_html_attributes_bracket_on_new_line splitjoin_ruby_hanging_args splitjoin_ruby_curly_braces\6g\bvim\0" },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["tabout.nvim"] = {
    config = { 'pcall(require, "config/plugins/tabout")' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-zoxide"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    after = { "trouble.nvim" },
    config = { 'pcall(require, "config/plugins/telescope")' },
    loaded = true,
    only_config = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tender.vim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/tender.vim",
    url = "https://github.com/jacoborus/tender.vim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble" },
    config = { "\27LJ\2\n\1\0\0\t\0\16\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\2\0015\4\14\0005\5\f\0005\6\b\0005\a\6\0009\b\5\0=\b\a\a=\a\t\0065\a\n\0009\b\5\0=\b\a\a=\a\v\6=\6\r\5=\5\15\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-e>\1\0\0\22open_with_trouble\14telescope trouble.providers.telescope\nsetup\ftrouble\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-quickrun"] = {
    commands = { "QuickRun" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/vim-quickrun",
    url = "https://github.com/thinca/vim-quickrun"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-visual-multi"] = {
    config = { "\27LJ\2\nÊ\6\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0∆\6    let g:VM_Mono_hl   = 'Visual'\n    let g:VM_Extend_hl = 'WildMenu'\n    let g:VM_Cursor_hl = 'Visual'\n    let g:VM_Insert_hl = 'IncSearch'\n\n    let g:VM_highlight_matches = 'red'\n    let g:VM_leader = '<space>'\n    let g:VM_maps = {}\n    let g:VM_maps['Find Under']         = '<C-d>'\n    let g:VM_maps['Find Subword Under'] = '<C-d>'\n\n    let g:VM_maps['Add Cursor Down']             = '<C-U>'\n    let g:VM_maps['Visual Cursors']              = '<space>'\n    let g:VM_maps['Switch Mode']                 = 'v'\n    let g:VM_maps['Visual Regex']                = '/'\n\n    \" autocmd User visual_multi_start nnoremap <c-l> l\n    \" autocmd User visual_multi_start nnoremap <c-h> h\n    \" autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>\n    \" autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>\n    \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    commands = { "WhichKey" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/fraser/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
require'dressing'.setup()
time([[Config for dressing.nvim]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
try_loadstring("\27LJ\2\n∑\1\0\0\2\0\5\0\0176\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0002splitjoin_html_attributes_bracket_on_new_line splitjoin_ruby_hanging_args splitjoin_ruby_curly_braces\6g\bvim\0", "config", "splitjoin.vim")
time([[Config for splitjoin.vim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
pcall(require, "config/plugins/telescope")
time([[Config for telescope.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
pcall(require, "config/plugins/neotest")
time([[Config for neotest]], false)
-- Config for: nvim-miniyank
time([[Config for nvim-miniyank]], true)
try_loadstring("\27LJ\2\nÕ\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0≠\1    map p <Plug>(miniyank-autoput)\n    map P <Plug>(miniyank-autoPut)\n    map <silent><c-p> <Plug>(miniyank-cycle)\n    map <silent><c-n> <Plug>(miniyank-cycleback)\n    \bcmd\bvim\0", "config", "nvim-miniyank")
time([[Config for nvim-miniyank]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require"config.spaceline"
time([[Config for galaxyline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
pcall(require, "config/plugins/gitsigns")
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
try_loadstring("\27LJ\2\nÊ\6\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0∆\6    let g:VM_Mono_hl   = 'Visual'\n    let g:VM_Extend_hl = 'WildMenu'\n    let g:VM_Cursor_hl = 'Visual'\n    let g:VM_Insert_hl = 'IncSearch'\n\n    let g:VM_highlight_matches = 'red'\n    let g:VM_leader = '<space>'\n    let g:VM_maps = {}\n    let g:VM_maps['Find Under']         = '<C-d>'\n    let g:VM_maps['Find Subword Under'] = '<C-d>'\n\n    let g:VM_maps['Add Cursor Down']             = '<C-U>'\n    let g:VM_maps['Visual Cursors']              = '<space>'\n    let g:VM_maps['Switch Mode']                 = 'v'\n    let g:VM_maps['Visual Regex']                = '/'\n\n    \" autocmd User visual_multi_start nnoremap <c-l> l\n    \" autocmd User visual_multi_start nnoremap <c-h> h\n    \" autocmd User visual_multi_exit nnoremap  <c-l> :TmuxNavigateRight<CR>\n    \" autocmd User visual_multi_exit nnoremap  <c-h> :TmuxNavigateLeft<CR>\n    \bcmd\bvim\0", "config", "vim-visual-multi")
time([[Config for vim-visual-multi]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
pcall(require, "config/plugins/nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nnn.nvim
time([[Config for nnn.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bnnn\frequire\0", "config", "nnn.nvim")
time([[Config for nnn.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require "config.plugins.nvim-cmp"
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
pcall(require, "config/plugins/nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nê\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\roverride\1\0\1\fdefault\2\arb\1\0\0\1\0\3\tname\aRb\ncolor\f#ff5f5f\ticon\bÓûë\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require 'config.plugins.luasnip'
time([[Config for LuaSnip]], false)
-- Config for: pounce.nvim
time([[Config for pounce.nvim]], true)
pcall(require, "config/plugins/pounce")
time([[Config for pounce.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
pcall(require, "config/plugins/nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\nê\3\0\0\b\0\16\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1K\0\1\0.<CMD>lua require('Navigator').right()<CR>\n<c-l>+<CMD>lua require('Navigator').up()<CR>\n<c-k>-<CMD>lua require('Navigator').down()<CR>\n<c-j>-<CMD>lua require('Navigator').left()<CR>\n<c-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require"colorizer".setup()
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
pcall(require, "config/plugins/nvim-surround")
time([[Config for nvim-surround]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd tabout.nvim ]]

-- Config for: tabout.nvim
pcall(require, "config/plugins/tabout")

vim.cmd [[ packadd onedark.nvim ]]
vim.cmd [[ packadd indent-blankline.nvim ]]

-- Config for: indent-blankline.nvim
pcall(require, "config/plugins/indent-blankline")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file QuickRun lua require("packer.load")({'vim-quickrun'}, { cmd = "QuickRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FZF lua require("packer.load")({'fzf'}, { cmd = "FZF", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dirbuf lua require("packer.load")({'dirbuf.nvim'}, { cmd = "Dirbuf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WhichKey lua require("packer.load")({'which-key.nvim'}, { cmd = "WhichKey", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <c-\\> <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "<lt>c-\\\\>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
