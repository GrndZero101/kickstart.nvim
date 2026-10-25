# Cheatsheet: Windows

A window is a viewport onto a buffer. All keys are normal mode. `<C-w>` is the window prefix. New splits open right and below (`splitright`, `splitbelow`).

## Create

| Key / Command        | Action                          |
| -------------------- | ------------------------------- |
| `<C-w>v` / `:vsplit` | Split vertically (side by side) |
| `<C-w>s` / `:split`  | Split horizontally (stacked)    |
| `:vsplit <file>`     | Vertical split opening a file   |
| `<C-w>n`             | New empty window                |

## Navigate

| Key                 | Action                         |
| ------------------- | ------------------------------ |
| `<C-w>h/j/k/l`      | Focus left / down / up / right |
| `<C-w>w` / `<C-w>W` | Next / previous window         |
| `<C-w>p`            | Previous (last used) window    |
| `<C-w>t` / `<C-w>b` | Top-left / bottom-right window |

## Close

| Key / Command      | Action                                      |
| ------------------ | ------------------------------------------- |
| `<C-w>q` / `:q`    | Close window (quits nvim if it is the last) |
| `<C-w>c`           | Close window, never quits nvim              |
| `<C-w>o` / `:only` | Close all other windows                     |

## Move and rearrange

| Key                 | Action                                         |
| ------------------- | ---------------------------------------------- |
| `<C-w>H/J/K/L`      | Move window to far left / bottom / top / right |
| `<C-w>r` / `<C-w>R` | Rotate windows                                 |
| `<C-w>x`            | Exchange with next window                      |
| `<C-w>T`            | Move window to a new tab page                  |

## Resize

| Key                  | Action                  |
| -------------------- | ----------------------- |
| `<C-w>=`             | Equalize sizes          |
| `<C-w>+` / `<C-w>-`  | Taller / shorter        |
| `<C-w>>` / `<C-w><`  | Wider / narrower        |
| `<C-w>_` / `<C-w>\|` | Maximize height / width |

> [!TIP]
> Prefix a count: `10<C-w>+` grows by 10 lines, `80<C-w>|` sets width to 80 columns.

> [!NOTE]
> Kickstart maps `<C-h/j/k/l>` to move focus. This config does not, so use `<C-w>h/j/k/l`. Neo-tree and Telescope open inside the same window system. Help: `:help windows`.
