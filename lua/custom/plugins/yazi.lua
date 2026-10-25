-- Yazi: terminal file manager in a floating window
-- https://github.com/mikavilpas/yazi.nvim
-- plenary.nvim is already installed by kickstart (Telescope), so nothing else is needed.

vim.pack.add { { src = 'https://github.com/mikavilpas/yazi.nvim', version = vim.version.range '*' } }

-- Copying relative paths from Yazi (<C-y>) needs GNU `realpath`, which Windows lacks.
-- Git for Windows ships one, the same way YAZI_FILE_ONE uses Git's `file.exe`.
local git_realpath = 'C:/Program Files/Git/usr/bin/realpath.exe'

require('yazi').setup {
  open_for_directories = false, -- leave `nvim .` to neo-tree for now
  keymaps = { show_help = '<F1>' }, -- press F1 inside Yazi for the plugin's keys
  integrations = {
    resolve_relative_path_application = vim.uv.fs_stat(git_realpath) and git_realpath or nil,
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>-', '<Cmd>Yazi<CR>', { desc = 'Yazi at current file' })
vim.keymap.set('n', '<leader>cw', '<Cmd>Yazi cwd<CR>', { desc = 'Yazi in working directory' })
vim.keymap.set('n', '<C-Up>', '<Cmd>Yazi toggle<CR>', { desc = 'Resume last Yazi session' })
