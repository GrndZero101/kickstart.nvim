# Cheatsheet: Discovering Keys (which-key)

Plugin: `which-key.nvim`. Press a key and pause: a popup lists what can come next.

## Try these (normal mode)

| Press               | Shows                                               |
| ------------------- | --------------------------------------------------- |
| `<leader>` (Space)  | All leader chains: Search, Toggle, Git Hunk         |
| `g`                 | `g` commands: `gg`, `gd`, `gr` LSP actions, `gc`... |
| `<C-w>`             | Window commands (see `cheatsheet-nvim-windows.md`)  |
| `z`                 | Folds and scrolling                                 |
| `"` / `'` / `` ` `` | Registers / marks                                   |
| `d`, `y`, `c`       | Operators waiting for a motion                      |

## In the popup

| Key            | Action            |
| -------------- | ----------------- |
| Any listed key | Follow that chain |
| `<BS>`         | Go up one level   |
| `<Esc>`        | Close             |

> [!TIP]
> Learning loop: press a prefix, read the popup, pick one, and repeat. `<leader>sk` (Telescope) searches every keymap by description.

> [!NOTE]
> Group names (`[S]earch`, `Git [H]unk`) are defined in the `spec` table in `init.lua`. Add a group there when you add a new `<leader>` chain. Help: `:help which-key`.
