# Cheatsheet: File Manager (neo-tree)

Plugin: `neo-tree.nvim` via `lua/custom/plugins/neo-tree.lua`. Press `?` inside the tree for the full list.

## Open / close (normal mode)

| Key / Command       | Action                                |
| ------------------- | ------------------------------------- |
| `\`                 | Open tree, revealing the current file |
| `\` (in tree)       | Close tree                            |
| `:Neotree toggle`   | Toggle the sidebar                    |
| `<C-w>h` / `<C-w>l` | Move focus tree ↔ editor              |

## Navigate (in tree)

| Key       | Action                              |
| --------- | ----------------------------------- |
| `j` / `k` | Move down / up                      |
| `<CR>`    | Open file / expand directory        |
| `s` / `S` | Open in vertical / horizontal split |
| `t`       | Open in new tab                     |
| `<BS>`    | Go up to parent directory           |
| `.`       | Set directory under cursor as root  |
| `C` / `z` | Close node / close all nodes        |
| `/`       | Fuzzy find                          |
| `H`       | Toggle hidden files                 |
| `R`       | Refresh                             |
| `q`       | Close tree                          |

## File operations (in tree)

| Key       | Action                                        |
| --------- | --------------------------------------------- |
| `a`       | Add file (end name with `/` for a directory)  |
| `A`       | Add directory                                 |
| `r`       | Rename                                        |
| `d`       | Delete                                        |
| `y` / `x` | Copy / cut to the tree clipboard              |
| `p`       | Paste from the tree clipboard                 |
| `c` / `m` | Copy / move, prompting for a destination path |

> [!TIP]
> To read docs side by side: `\`, move to `docs/`, press `s` on a file to open it in a vertical split.

> [!WARNING]
> `d` deletes from disk after a confirmation prompt. Inside a git repo, `git restore` only recovers tracked files.

> [!NOTE]
> `\` is a Kickstart default and the `<leader>` key is Space. Help: `:help neo-tree`.
