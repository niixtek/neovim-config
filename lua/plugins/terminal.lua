--ToggleTerm
require('toggleterm').setup({
  open_mapping = [[<c-\>]],
  hide_numbers = true, 
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', 
  start_in_insert = true,
  insert_mappings = true, 
  persist_size = true,
  direction = 'float',
  close_on_exit = true, 
  shell = vim.o.shell,
  float_opts = {
    border =  'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    }
  }
})
