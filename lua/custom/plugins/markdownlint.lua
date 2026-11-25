-- markdownlint: turn off two rules that clash with the cheatsheet style
-- The linter itself is enabled by `require 'kickstart.plugins.lint'` in init.lua,
-- which loads before this file. A project's own .markdownlint.* config still applies on top.
--
--   MD013 line-length: wide tables and long prose lines are fine.
--   MD028 no-blanks-blockquote: a blank line between consecutive GitHub alerts
--         (> [!TIP], > [!NOTE], ...) is what keeps them separate.

local lint = require 'lint'
local markdownlint = lint.linters.markdownlint
markdownlint.args = { '--stdin', '--disable', 'MD013', 'MD028' } -- --disable takes the rest of the line

-- Hide / show markdownlint warnings (MD060 etc.) in every buffer. The linter keeps running,
-- so turning them back on shows current results straight away.
vim.keymap.set('n', '<leader>ta', function()
  local filter = { ns_id = lint.get_namespace 'markdownlint' }
  local enable = not vim.diagnostic.is_enabled(filter)
  vim.diagnostic.enable(enable, filter)
  vim.notify('Markdownlint warnings ' .. (enable and 'on' or 'off'))
end, { desc = '[T]oggle markdownlint [A]lerts' })
