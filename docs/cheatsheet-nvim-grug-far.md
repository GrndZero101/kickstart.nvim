# Cheatsheet: Find and Replace (grug-far)

Plugin: `grug-far.nvim` via `lua/custom/plugins/grug-far.lua`. Searches with ripgrep and shows a live preview of every match, grouped by file. Press `g?` inside the panel for the full list.

## Open (normal or visual mode)

| Key / Command     | Action                                      |
| ----------------- | ------------------------------------------- |
| `<leader>sR`      | Find and replace across the project         |
| `<leader>sB`      | Find and replace in the current buffer only |
| `<C-g>` (in Yazi) | Find and replace in the hovered directory   |
| `:GrugFar`        | Same as `<leader>sR`                        |
| `:GrugFarWithin`  | Limit to the lines of the visual selection  |

In visual mode, `<leader>sR` and `<leader>sB` pre-fill the search with the selected text.

## The panel

The top of the panel is a form. Fill it in like normal text, in insert mode.

| Field        | What goes in it                                               |
| ------------ | ------------------------------------------------------------- |
| Search       | Text or regex to find (ripgrep syntax)                        |
| Replace      | Replacement; `$1`, `$2` use regex capture groups              |
| Files Filter | Globs, one per line: `*.py`, `!*test*`                        |
| Flags        | ripgrep flags: `--ignore-case`, `--fixed-strings`, `--hidden` |
| Paths        | Folders or files to search; empty means the working directory |

Results update as you type and appear below the form.

## Keys in the panel (normal mode)

| Key                    | Action                                                          |
| ---------------------- | --------------------------------------------------------------- |
| `<Tab>` / `<S-Tab>`    | Next / previous form field                                      |
| `<Enter>`              | Go to the match under the cursor                                |
| `<Down>` / `<Up>`      | Open the next / previous match in the other window              |
| `<localleader>r`       | Replace all matches                                             |
| `<localleader>j` / `k` | Apply the change on this line, then move to the next / previous |
| `<localleader>s`       | Sync: write your edits in the results back to the files         |
| `<localleader>l`       | Sync the result line under the cursor only                      |
| `<localleader>q`       | Send matches to the quickfix list                               |
| `<localleader>t`       | Open search history                                             |
| `<localleader>i`       | Preview the match under the cursor in a float                   |
| `<localleader>w`       | Show the ripgrep command being run                              |
| `<localleader>c`       | Close the panel                                                 |
| `g?`                   | Show all keys                                                   |

> [!TIP]
> You can edit lines directly in the results list, then press `<localleader>s` to write just those edits back. Delete a result line with `dd` to leave that match unchanged. Together these are a precise alternative to Replace all.

> [!WARNING]
> Replace and sync write straight to disk, and `u` in the panel does not undo them. Commit first, or use `git diff` and `git restore` to check and roll back.

> [!NOTE]
> `<localleader>` is Space in this config, so Replace all is `<Space>r`. Help: `:help grug-far`.
