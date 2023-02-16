--Cursor Line
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 0,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

--Hop
require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})

-- Specs (Cursor effect when jump long length)
require('specs').setup{
	show_jumps  = true,
	min_jump = 30,
	popup = {
		delay_ms = 0, -- delay before popup displays
		inc_ms = 20, -- time increments used for fade/resize effects
		blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
		width = 20,
		winhl = 'PMenu',
		fader = require('specs').pulse_fader,
		resizer = require('specs').shrink_resizer
	},
	ignore_filetypes = {},
	ignore_buftypes = {
		nofile = true,
	},
}

