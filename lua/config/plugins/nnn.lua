require("nnn").setup({
	picker = {
		cmd = "tmux new-session nnn -Pp",
		style = { border = "rounded" },
		session = "shared",
	},
	replace_netrw = "picker",
	windownav = "<C-l>"
})
