local project = require('neovim-project')

project.setup({
	projects={
		"~/Projects/*",
		"~/.config/nvim"
	},
	last_session_on_startup = false,
})
