# Cheatsheet: Autocomplete

Plugin: `blink.cmp`, preset `default` (Vim-style keys). Insert mode.

## Completion menu

| Key                 | Action                                |
| ------------------- | ------------------------------------- |
| `<C-n>` / `<C-p>`   | Next / previous item                  |
| `<C-y>`             | **Accept** selected item              |
| `<C-e>`             | Close menu (end)                      |
| `<C-space>`         | Open menu; press again to toggle docs |
| `<C-k>`             | Toggle signature help                 |
| `<Tab>` / `<S-Tab>` | Next / previous snippet placeholder   |

> [!TIP]
> The first item is preselected, so `<C-y>` right away takes the top match.

## Built-in Vim completion

Works without any plugin. Useful to learn what `blink.cmp` wraps.

| Key               | Completes from              |
| ----------------- | --------------------------- |
| `<C-n>` / `<C-p>` | Buffers and includes        |
| `<C-x><C-f>`      | File paths                  |
| `<C-x><C-o>`      | Omni (LSP-backed in Neovim) |
| `<C-x><C-n>`      | Current buffer only         |

> [!NOTE]
> `<Enter>` and `<Tab>` do **not** accept. Change `preset` in `init.lua` to `enter` or `super-tab` if you want that.
