# Cheatsheet: Buffers and Tabline

Plugin: `mini.tabline` (in `init.lua`). The top bar shows one entry per open **buffer**, not per Vim tab page.

## Buffers (normal mode)

| Key / Command       | Action                                 |
| ------------------- | -------------------------------------- |
| `:bnext` / `:bprev` | Next / previous buffer                 |
| `:b <name><Tab>`    | Jump to buffer by name                 |
| `<C-^>`             | Toggle between current and last buffer |
| `:ls`               | List buffers                           |
| `:bdelete` (`:bd`)  | Close buffer (removes it from the bar) |
| `<leader><leader>`  | Telescope buffer picker                |

## Vim tab pages (different from buffers)

| Key / Command | Action                         |
| ------------- | ------------------------------ |
| `:tabnew`     | New tab page (a window layout) |
| `gt` / `gT`   | Next / previous tab page       |

> [!TIP]
> `<C-^>` is the fastest way to flip between two files.

> [!NOTE]
> `mini.tabline` is part of `mini.nvim`. Help: `:help mini.tabline`.
