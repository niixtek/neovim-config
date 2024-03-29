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
--require('scrollbar').setup({
--})
----  Gitsigns support
--require("scrollbar.handlers.gitsigns").setup()
