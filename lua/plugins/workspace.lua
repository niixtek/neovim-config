-- Workspace 
require('workspaces').setup({
	hooks = {
		open = { 'Telescope find_files' },
	}
})

--Session
require('sessions').setup({
	hooks = {
		open = { 'Telescope find_files' },
	}
})
