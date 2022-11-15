-- this writes its own log file ~/.local/state/nvim/neotest.log
--
-- remember to install treesitter ruby or none of this will work:
--    :TSInstall ruby

-- Neotest is tied to this command: 'bundle exec rspec TEST_FILE'
-- You have to have a Gemfile that specifies how to get all needed gems for
-- this to work.
-- If the tests are all failed but have no output, step back and run that
-- command on a single test to see if there is an environment problem.

-- logs here: ~/.local/state/nvim/neotest.log

-- FIXME: needs some keyboard shorcuts

-- neotest configuration copied from prdanelli
local status_ok, neotest = pcall(require, "neotest")
if not status_ok then return end

neotest.setup({
  adapters = {
    require("neotest-plenary"),
    require("neotest-rspec") ({
      -- set the comand that neotest uses to run rspec.
      -- FIXME: use this to break the dependency on bundle and make it so I no longer need a Gemfile to run tests
      rspec_cmd = function()
        return vim.tbl_flatten({
          "rake",
          "spec",
        })
      end
    })
  },
  diagnostic = {
    enabled = true
  },
  discovery = {
    enabled = true
  },
  floating = {
    border = "rounded",
    max_height = 0.6,
    max_width = 0.6,
    options = {}
  },
  highlights = {
    adapter_name = "NeotestAdapterName",
    border = "NeotestBorder",
    dir = "NeotestDir",
    expand_marker = "NeotestExpandMarker",
    failed = "NeotestFailed",
    file = "NeotestFile",
    focused = "NeotestFocused",
    indent = "NeotestIndent",
    marked = "NeotestMarked",
    namespace = "NeotestNamespace",
    passed = "NeotestPassed",
    running = "NeotestRunning",
    select_win = "NeotestWinSelect",
    skipped = "NeotestSkipped",
    test = "NeotestTest"
  },
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "✖",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "✔",
    running = "~",
    skipped = "ﰸ",
    unknown = "?"
  },
  jump = {
    enabled = true
  },
  output = {
    enabled = true,
    open_on_run = "short"
  },
  run = {
    enabled = true
  },
  status = {
    enabled = true
  },
  strategies = {
    integrated = {
      height = 40,
      width = 120
    }
  },
  summary = {
    enabled = true,
    expand_errors = true,
    follow = true,
    mappings = {
      attach = "a",
      expand = { "<CR>", "<2-LeftMouse>" },
      expand_all = "e",
      jumpto = "i",
      output = "o",
      run = "r",
      short = "O",
      stop = "u"
    }
  }
})


vim.cmd [[command! Neotest lua require('neotest').summary.open()]]
vim.cmd [[command! NeotestRun lua require('neotest').run.run()]]
-- You can show the next failed test message with :LspSaga diagnostic_jump_next (currently mapped to ]e)
