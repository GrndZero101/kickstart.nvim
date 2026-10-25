-- Indentation defaults: spaces, not tabs. 2 for config, docs and shell; 4 for Python and everything else.
-- Neovim's own default is tabs at width 8. Formatters (jsonls, yamlls, taplo, shfmt) follow these settings.
--
-- What takes priority, from highest to lowest:
--   1. A project's .editorconfig (supported natively by Neovim, see `:help editorconfig`)
--   2. guess-indent.nvim, which copies the style of a file that is already indented
--   3. These defaults, used for new files and files with no indentation yet (like minified JSON)
-- Files that require tabs, like Makefiles and Go, keep them: their filetype plugins set noexpandtab.

vim.o.expandtab = true -- insert spaces when pressing <Tab> or indenting
vim.o.shiftwidth = 4 -- width of one indent level for >>, << and autoindent
vim.o.tabstop = 4 -- how wide an existing tab character is displayed
vim.o.softtabstop = 4 -- <Tab> and <BS> in insert mode move by one indent level

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Use 2-space indentation for config, docs and shell files',
  group = vim.api.nvim_create_augroup('custom-indentation', { clear = true }),
  pattern = { 'json', 'jsonc', 'yaml', 'toml', 'markdown', 'sh', 'bash', 'zsh', 'lua' },
  callback = function(args)
    vim.bo[args.buf].expandtab = true
    vim.bo[args.buf].shiftwidth = 2
    vim.bo[args.buf].tabstop = 2
    vim.bo[args.buf].softtabstop = 2
    -- FileType fires after guess-indent has already looked at the file, so ask it again.
    -- It changes nothing when it cannot detect a style, and defers to .editorconfig.
    require('guess-indent').set_from_buffer(args.buf, 'auto_cmd', true)
  end,
})
