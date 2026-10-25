-- Markdown: in-buffer rendering plus soft wrapping for prose
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
--
-- Uses the markdown / markdown_inline treesitter parsers that kickstart already installs.
-- Rendered in normal mode, raw text in insert mode.

vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup {}

vim.keymap.set('n', '<leader>tm', '<Cmd>RenderMarkdown toggle<CR>', { desc = '[T]oggle [M]arkdown rendering' })

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Soft-wrap prose at word boundaries and keep list indentation',
  group = vim.api.nvim_create_augroup('custom-markdown-wrap', { clear = true }),
  pattern = 'markdown',
  callback = function()
    vim.wo.wrap = true
    vim.wo.linebreak = true -- wrap at 'breakat' chars (spaces) instead of mid-word
    vim.wo.breakindent = true -- wrapped lines keep the indent of their start
  end,
})
