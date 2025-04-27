local project = require('startup')

project.setup({
	theme='dashboard',
  	options = {
   	mapping_keys = true, -- display mapping (e.g. <leader>ff)
   	cursor_column = 0.5,
	},
	mappings = {
   	execute_command = "<CR>",
   	open_file = "o",
   	open_file_split = "<c-o>",
   	open_section = "<TAB>",
   	open_help = "?",
	},
	colors = {
		background = "#1f2227",
		folded_section = "#56b6c2", -- the color of folded sections
  },
})
