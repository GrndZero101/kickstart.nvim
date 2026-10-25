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

## Sources and snippets

The menu mixes LSP items, file paths, snippets and words from the current buffer. Documentation for the selected item opens automatically after a short delay.

Snippets come from `friendly-snippets` (VS Code style) through LuaSnip. Type a trigger such as `def`, `if` or `for`, accept it with `<C-y>`, then fill each placeholder and move between them with `<Tab>` / `<S-Tab>`.

> [!NOTE]
> Autopairs is on, so typing `(`, `[`, `{` or a quote inserts the closing character too. Typing the closer yourself steps over it.

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
