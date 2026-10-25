-- Neo-tree: sidebar file browser, toggle with '\'
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--
-- Copy of lua/kickstart/plugins/neo-tree.lua with one addition (the file watcher).
-- Kept here so upstream changes to the kickstart file can never conflict with it.
-- Leave `require 'kickstart.plugins.neo-tree'` commented out in init.lua.

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  filesystem = {
    -- Refresh on changes made outside nvim (shell, git, other tools) via OS file watchers.
    -- Without it the tree only refreshes on nvim events or when you press `R`.
    use_libuv_file_watcher = true,
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
