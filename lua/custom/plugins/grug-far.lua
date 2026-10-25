-- grug-far: project-wide find and replace with a live preview, powered by ripgrep
-- https://github.com/MagicDuck/grug-far.nvim
--
-- Also used by yazi.nvim: <C-g> inside the Yazi float opens grug-far for that directory.
-- Inside the grug-far buffer, press g? for its keys. See `:help grug-far`.

vim.pack.add { 'https://github.com/MagicDuck/grug-far.nvim' }
require('grug-far').setup {}

-- In visual mode both keys pre-fill the search with the selected text.
vim.keymap.set({ 'n', 'x' }, '<leader>sR', function() require('grug-far').open() end, { desc = '[S]earch and [R]eplace in project' })
vim.keymap.set(
  { 'n', 'x' },
  '<leader>sB',
  function() require('grug-far').open { prefills = { paths = vim.fn.expand '%' } } end,
  { desc = '[S]earch and replace in current [B]uffer' }
)
