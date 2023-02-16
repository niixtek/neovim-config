
--Lua line
require('lualine').setup {
	extensions = { 
		'toggleterm',
		'nvim-tree',
	},
	options = {
		icons_enabled = true,
		theme = 'auto',
	},
	sections = {
		lualine_b = {'branch', 'diff'},
		lualine_c = {{'filename', path = 3 }},
	},
	inactive_sections = {
		lualine_c = {{'filename', path = 3 }},
	}
}
