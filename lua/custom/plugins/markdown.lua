-- Markdown: in-buffer rendering plus soft wrapping for prose
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
--
-- Uses the markdown / markdown_inline treesitter parsers that kickstart already installs.
-- Rendered in normal mode, raw text in insert mode.

vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }
local render_markdown = require 'render-markdown'
render_markdown.setup {}

vim.keymap.set('n', '<leader>tm', '<Cmd>RenderMarkdown toggle<CR>', { desc = '[T]oggle [M]arkdown rendering' })

-- Alerts (`> [!NOTE]`, `> [!WARNING]`, ...) have no enable flag of their own, so this re-runs
-- setup with every callout's `raw` pattern swapped for one that never matches. With alerts off
-- they render as ordinary block quotes; everything else is untouched.
local alerts_enabled = true
vim.keymap.set('n', '<leader>ta', function()
  alerts_enabled = not alerts_enabled
  local callout = {}
  if not alerts_enabled then
    for name, value in pairs(render_markdown.default.callout) do
      callout[name] = { raw = '\n' .. value.raw } -- a link's text never starts with a newline
    end
  end
  local rendering = render_markdown.get() -- setup resets this, so carry it over
  render_markdown.setup { enabled = rendering, callout = callout }
  render_markdown.set(rendering) -- redraw open buffers with the new config
  vim.notify('Markdown alerts ' .. (alerts_enabled and 'on' or 'off'))
end, { desc = '[T]oggle markdown [A]lerts' })

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
