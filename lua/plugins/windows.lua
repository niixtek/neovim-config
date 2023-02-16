--Focus and shade
require('focus').setup()
vim.api.nvim_set_keymap('n', '<c-l>', ':FocusSplitNicely<CR>', { silent = true })

require('shade').setup({
  overlay_opacity = 50,
})
--CodeWindow
require('codewindow').setup({
})

--Smooth Scroll
require('neoscroll').setup()

-- Scrollbar
require('scrollview').setup({
  excluded_filetypes = {'nerdtree'},
  current_only = true,
  winblend = 75,
  base = 'buffer',
  column = 80
})

