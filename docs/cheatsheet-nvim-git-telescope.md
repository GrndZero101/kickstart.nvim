# Cheatsheet: Gitsigns and Telescope

Plugins: `gitsigns.nvim` (line changes), `telescope.nvim` (fuzzy finder). Leader is Space. Normal mode unless noted.

## Gitsigns

Gutter marks: `+` added, `~` changed, `_` deleted.

| Key                 | Action                                                   |
| ------------------- | -------------------------------------------------------- |
| `]c` / `[c`         | Next / previous changed hunk                             |
| `<leader>hp`        | Preview hunk (popup diff)                                |
| `<leader>hi`        | Preview hunk inline                                      |
| `<leader>hs` / `hr` | Stage / reset hunk (also in visual mode for a selection) |
| `<leader>hS` / `hR` | Stage / reset whole buffer                               |
| `<leader>hb`        | Blame line (full commit)                                 |
| `<leader>tb`        | Toggle inline blame on every line                        |
| `<leader>hd` / `hD` | Diff against index / last commit                         |

## Telescope

| Key                 | Action                         |
| ------------------- | ------------------------------ |
| `<leader>sf`        | Search files                   |
| `<leader>sg`        | Live grep (needs `rg`)         |
| `<leader>sw`        | Search word under cursor       |
| `<leader><leader>`  | Switch open buffers            |
| `<leader>/`         | Fuzzy search in current buffer |
| `<leader>s.`        | Recent files                   |
| `<leader>sr`        | Resume last search             |
| `<leader>sh` / `sk` | Search help / keymaps          |
| `<leader>sd`        | Search diagnostics             |
| `<leader>sn`        | Search Neovim config files     |
| `<leader>ss`        | List every Telescope picker    |

In the picker: `<C-n>` / `<C-p>` move, `<CR>` open, `<C-x>` / `<C-v>` open in split / vsplit, `<C-/>` (insert) or `?` (normal) show picker keys, `<Esc>` close.

## LSP pickers (when a server is attached)

| Key                           | Action                                                     |
| ----------------------------- | ---------------------------------------------------------- |
| `grr` / `gri` / `grd` / `grt` | References / implementation / definition / type definition |
| `gO` / `gW`                   | Document / workspace symbols                               |

> [!TIP]
> Forgot a key? `<leader>sk` searches every keymap, and `<leader>ss` shows what Telescope can do.

> [!NOTE]
> Telescope's git pickers are separate from Gitsigns: `:Telescope git_status`, `git_commits`, `git_branches`.
