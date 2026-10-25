-- Buffer line: one tab per open buffer across the top of the screen
-- mini.nvim is already installed by kickstart's init.lua, so only the module setup is needed here.
-- See `:help mini.tabline`

require('mini.tabline').setup { show_icons = vim.g.have_nerd_font }
