--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--disable ^C-c
vim.api.nvim_set_keymap('', '<C-c>', '<Nop>', { noremap = true, silent = true })

--Rest
vim.api.nvim_set_keymap('n', '<leader>rr', [[<cmd>lua require('rest-nvim').run()<CR>]], { noremap = true, silent = true })

-- Comment Line 
vim.api.nvim_set_keymap('v', '<leader>c', '<Plug>ToggleCommaround', {})

-- Telescopte
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gd', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pp', [[<cmd>lua require'telescope'.extensions.project.project()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ww', [[<cmd>lua require'telescope'.extensions.workspaces.workspaces()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require'telescope'.extensions.file_browser.file_browser()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ge', [[<cmd>lua require'telescope'.extensions.emoji.emoji()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>//', ':Telescope<CR>', { noremap = true, silent = true })

--Hop 
vim.api.nvim_set_keymap('', 'f', [[<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>]], {})
vim.api.nvim_set_keymap('', 'F', [[<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>]], {})
vim.api.nvim_set_keymap('', 't', [[<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR> ]], {})
vim.api.nvim_set_keymap('', 'T', [[<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR> ]], {})

-- LazyGit
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

--Lsp
vim.api.nvim_set_keymap('n', '<leader>f', '[[<cmd>lua vim.lsp.buf.formatting()<CR>]]', { silent = true })

