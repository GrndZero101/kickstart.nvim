# Cheatsheet: File Manager (Yazi)

Plugin: `yazi.nvim` via `lua/custom/plugins/yazi.lua`, running Yazi in a floating window. Inside the float, `<F1>` lists the Neovim keys and `~` lists all Yazi keys.

## Open / close (normal mode)

| Key / Command | Action                                      |
| ------------- | ------------------------------------------- |
| `<leader>-`   | Open Yazi at the current file (also visual) |
| `<leader>cw`  | Open Yazi in Neovim's working directory     |
| `<C-Up>`      | Resume the last Yazi session                |
| `:Yazi`       | Same as `<leader>-`; add `cwd` or `toggle`  |
| `q` (in Yazi) | Close Yazi and return to Neovim             |

## Neovim integration (in Yazi)

| Key                   | Action                                               |
| --------------------- | ---------------------------------------------------- |
| `<Enter>` / `o` / `l` | Open the file in Neovim                              |
| `<C-v>` / `<C-x>`     | Open in vertical / horizontal split                  |
| `<C-t>`               | Open in a new tab                                    |
| `<C-o>`               | Open and pick the target window                      |
| `<Tab>`               | Jump the cursor between files open in Neovim buffers |
| `<C-s>`               | Telescope live grep in the hovered directory         |
| `<C-y>`               | Copy relative path of selected files                 |
| `<C-q>`               | Send selected files to the quickfix list             |
| `<C-\>`               | Set Neovim's working directory to Yazi's directory   |
| `<F1>`                | Show these keys                                      |

> [!TIP]
> Select several files with `<Space>`, then press `<Enter>` to send them all to the quickfix list. Step through with `]q` / `[q`.

## Navigate (in Yazi)

| Key                   | Action                                            |
| --------------------- | ------------------------------------------------- |
| `h` / `j` / `k` / `l` | Parent / down / up / enter directory or open file |
| `H` / `L`             | Back / forward through directory history          |
| `gg` / `G`            | Top / bottom                                      |
| `<C-u>` / `<C-d>`     | Half page up / down                               |
| `K` / `J`             | Scroll the preview up / down                      |
| `f{char}`             | Jump to the next file starting with `{char}`      |
| `/` / `?`             | Find next / previous match by name                |
| `n` / `N`             | Next / previous match                             |
| `F`                   | Filter the list (`<Esc>` clears)                  |
| `.`                   | Toggle hidden files                               |
| `gh` / `gc` / `gd`    | Go to home / config / Downloads                   |
| `g<Space>`            | Type a path to jump to                            |

## Search (in Yazi)

| Key | Action                                    |
| --- | ----------------------------------------- |
| `s` | Search file names below here (`fd`)       |
| `S` | Search file contents below here (`rg`)    |
| `z` | Fuzzy-jump to a file or directory (`fzf`) |
| `Z` | Jump to a frequent directory (`zoxide`)   |

`<Esc>` cancels a search. Yazi's own `<C-s>` cancel is replaced by the grep key above.

## Select (in Yazi)

| Key               | Action                          |
| ----------------- | ------------------------------- |
| `<Space>`         | Toggle selection, move down     |
| `v` / `V`         | Visual select / visual unselect |
| `<C-a>` / `<C-r>` | Select all / invert selection   |
| `<Esc>`           | Clear selection or leave visual |

## File operations (in Yazi)

| Key         | Action                                                  |
| ----------- | ------------------------------------------------------- |
| `a`         | Create file (end the name with `/` for a directory)     |
| `r`         | Rename; with several selected, bulk rename in an editor |
| `y` / `x`   | Copy / cut selected files                               |
| `p` / `P`   | Paste / paste overwriting existing files                |
| `Y` / `X`   | Cancel the copy or cut                                  |
| `d`         | Move to the Recycle Bin                                 |
| `D`         | Delete permanently                                      |
| `cc` / `cd` | Copy file path / directory path to the clipboard        |
| `cf` / `cn` | Copy file name / name without extension                 |

> [!WARNING]
> `D` skips the Recycle Bin. Prefer `d` unless you are sure.

## Shell, tabs and view (in Yazi)

| Key                 | Action                                                                                       |
| ------------------- | -------------------------------------------------------------------------------------------- |
| `!`                 | Open PowerShell in the current directory                                                     |
| `;` / `:`           | Run a shell command / run and wait for it                                                    |
| `tt`                | New Yazi tab here                                                                            |
| `1`–`9` / `[` / `]` | Switch tab by number / previous / next                                                       |
| `w`                 | Task manager (running copies and moves)                                                      |
| `,` then a key      | Sort: `m` modified, `s` size, `a` alphabetical, `n` natural, `e` extension; capital reverses |
| `m` then a key      | Line info: `s` size, `m` modified, `p` permissions, `n` none                                 |

> [!NOTE]
> `l`, `f`, `F` and `!` are personal overrides in `%APPDATA%\yazi\config\keymap.toml`. Yazi's defaults are `l` enter directory only, `f` filter, and no `!` or `F`.
> The `<C-g>` replace-in-directory key does nothing, because it needs `grug-far.nvim`, which is not installed.
> The `<leader>` key is Space. There is no `:help` page. See <https://github.com/mikavilpas/yazi.nvim> and <https://yazi-rs.github.io/docs/quick-start>.
