-- packer Installer command from https://github.com/mjlbach/defaults.nvim/blob/master/init.lua
--
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
	use 'neovim/nvim-lspconfig' -- LSP
	use 'romgrk/barbar.nvim'
  use 'karb94/neoscroll.nvim' -- SmoothScroll
	use 'mattn/emmet-vim' -- Emmet
	use { 'NTBBloodbath/rest.nvim', requires = { 'nvim-lua/plenary.nvim' } } 
  use 'tpope/vim-fugitive' -- Git Command 
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use({ 'rose-pine/neovim', as = 'rose-pine' }) --Theme
	use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } } -- Telescope Manage Files Search
  use 'itchyny/lightline.vim' -- Fancier statusline
  use 'hrsh7th/nvim-compe' -- Autocompletion plugin
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)

-- Vim Options
vim.o.encoding = 'utf-8'
vim.o.relativenumber = true
vim.o.ai = true
vim.o.ruler = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250 
vim.o.hidden = true --Do not save when swap buffer
vim.o.hlsearch = true
vim.o.breakindent = true 
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.cursorcolumn = true
vim.wo.cursorline = true
vim.cmd [[set undofile]]

--Python indent 
--vim.api.nvim_command([[
--	au BufNewFile,BufRead *.py set tabstop=4
--	au BufNewFile,BufRead *.py set softtabstop=4
--	au BufNewFile,BufRead *.py set shiftwidth=4
--	au BufNewFile,BufRead *.py set expandtab
--	au BufNewFile,BufRead *.py set autoindent
--	au BufNewFile,BufRead *.py set fileformat=unix
--]])

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Theme
vim.o.termguicolors = true
vim.cmd [[colorscheme rose-pine ]]
--require('rose-pine').set()
vim.g.rose_pine_variant = 'moon'
vim.g.rose_pine_enable_italics = true

	--Set statusbar
vim.g.lightline = {
--  colorscheme = 'rose-pine',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Barbar Config
vim.api.nvim_set_keymap('n', '<A-,>', ':BufferPrevious<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferNext<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferMovePrevious<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A->>', ':BufferMoveNext<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A-c>', ':BufferClose<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A-s>', ':BufferPick<CR>', { silent = true})

-- NeoScroll
require('neoscroll').setup()

--TeleScope
--nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
--nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
--nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
--nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
--vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').findfiles_
--

--Rest Tool
require('rest-nvim').setup()
-- Emmet
vim.g["user_emmet_leader_key"] = ','
