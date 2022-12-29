-- needs this: LspInstall json

-- abort if plugin not installed
if not prequire('jsonpath') then return end

-- -- show json path in the winbar
-- if vim.fn.exists("+winbar") == 1 then
--   vim.opt_local.winbar = "%{%v:lua.require'jsonpath'.get()%}"
-- end

-- send json path to clipboard
vim.keymap.set("n", "y<C-p>", function()
  vim.fn.setreg("+", require("jsonpath").get())
end, { desc = "copy json path", buffer = true })
