-- markdownlint: turn off two rules that clash with the cheatsheet style
-- The linter itself is enabled by `require 'kickstart.plugins.lint'` in init.lua,
-- which loads before this file. A project's own .markdownlint.* config still applies on top.
--
--   MD013 line-length: wide tables and long prose lines are fine.
--   MD028 no-blanks-blockquote: a blank line between consecutive GitHub alerts
--         (> [!TIP], > [!NOTE], ...) is what keeps them separate.

local markdownlint = require('lint').linters.markdownlint
markdownlint.args = { '--stdin', '--disable', 'MD013', 'MD028' } -- --disable takes the rest of the line
