# Cheatsheet: `z` Commands

`z` covers **folds**, **scroll position** and **spelling**. Normal mode.

## Scroll the view (cursor stays on its line)

| Key            | Action                                                    |
| -------------- | --------------------------------------------------------- |
| `zt` / `z<CR>` | Cursor line to top (`z<CR>` also goes to first non-blank) |
| `zz` / `z.`    | Cursor line to centre                                     |
| `zb` / `z-`    | Cursor line to bottom                                     |
| `zh` / `zl`    | Scroll left / right (when `nowrap`)                       |
| `zH` / `zL`    | Scroll half a screen left / right                         |

## Folds

| Key          | Action                                           |
| ------------ | ------------------------------------------------ |
| `za`         | Toggle fold under cursor                         |
| `zo` / `zO`  | Open fold / open all nested folds                |
| `zc` / `zC`  | Close fold / close all nested folds              |
| `zR` / `zM`  | Open / close **all** folds in buffer             |
| `zr` / `zm`  | Open / close one more level everywhere           |
| `zv`         | Open just enough folds to see the cursor line    |
| `zj` / `zk`  | Move to start of next / end of previous fold     |
| `zi`         | Toggle folding on / off                          |
| `zf{motion}` | Create fold (`zfap` = paragraph, `zF` = N lines) |
| `zd` / `zD`  | Delete fold / delete nested folds                |
| `zE`         | Eliminate all folds                              |

## Spelling (`:set spell` first)

| Key           | Action                          |
| ------------- | ------------------------------- |
| `]s` / `[s`   | Next / previous misspelled word |
| `z=`          | Suggest corrections             |
| `zg` / `zw`   | Add word to good / wrong list   |
| `zug` / `zuw` | Undo the above                  |

> [!TIP]
> `zz` is the one to build the habit on: after jumping with `n`, `G` or a search, press `zz` to centre the line.

> [!NOTE]
> Fold method is the default `manual`, so there are no folds until you create them with `zf`. Setting `foldmethod=indent` or a treesitter `foldexpr` would create them automatically. Help: `:help fold.txt`.
