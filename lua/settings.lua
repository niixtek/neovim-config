vim.o.encoding = 'utf-8'

vim.o.mouse = false

vim.o.relativenumber = true
vim.o.ruler = true

-- Indent Options
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Search Options
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250

vim.o.breakindent = true
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.cursorcolumn = false
vim.wo.cursorline = true
--vim.cmd [[set undofile]]
--vim.o.hidden = true --Do not save when swap buffer

-- Show Space Tab and EOL Symbol
vim.opt.list = true
vim.opt.listchars:append('space:·')
vim.opt.listchars:append('tab:▸ ')
vim.opt.listchars:append('eol:↴')

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--disable ^C-c
vim.api.nvim_set_keymap('', '<C-c>', '<Nop>', { noremap = true, silent = true })
