-- precognition: faint hints showing where motions would land from the cursor
-- https://github.com/tris203/precognition.nvim
--
-- A virtual line under the cursor line marks w, b, e, ^, $ and % targets.
-- The gutter marks gg, G, { and }. Turn it off once the motions are automatic.

vim.pack.add { 'https://github.com/tris203/precognition.nvim' }
require('precognition').setup {} -- defaults: visible at startup

vim.keymap.set('n', '<leader>tp', function()
  if require('precognition').toggle() then
    vim.notify 'Precognition on'
  else
    vim.notify 'Precognition off'
  end
end, { desc = '[T]oggle [P]recognition motion hints' })
