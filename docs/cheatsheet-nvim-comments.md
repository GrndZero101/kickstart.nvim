# Cheatsheet: Comments

Line comments (`gc`) are built into Neovim 0.10+. Block comments (`gb`) come from `lua/custom/plugins/block-comment.lua`, which is part of this config, not a plugin. Both toggle: the same keys comment and uncomment. Normal mode unless noted.

## Line comments: `gc` (built in)

Uses the filetype's comment style: `--` in SQL and Lua, `#` in YAML and shell, `//` in C and JavaScript.

| Key            | Action                                                        |
| -------------- | ------------------------------------------------------------- |
| `gcc` / `3gcc` | Toggle the current line / 3 lines                             |
| `gc{motion}`   | Toggle over a motion: `gcip` paragraph, `gcj` two lines       |
| `gc` (visual)  | Toggle the selected lines                                     |
| `gcgc`         | Uncomment the whole comment block the cursor is in            |
| `dgc` / `ygc`  | Delete / yank that comment block (`gc` is also a text object) |

## Block comments: `gb` (this config)

Wraps whole lines: `/*` goes before the first line's text and `*/` after the last line's.

| Key            | Action                                                  |
| -------------- | ------------------------------------------------------- |
| `gbc` / `3gbc` | Toggle a block comment on the current line / 3 lines    |
| `gb{motion}`   | Toggle over a motion: `gbip` paragraph, `gbj` two lines |
| `gb` (visual)  | Toggle around the selected lines                        |

```sql
/* select id
from users
where id = 1; */
```

| Filetype            | `gb` gives                                   |
| ------------------- | -------------------------------------------- |
| SQL, C, JS, CSS     | `/* ... */`                                  |
| Lua                 | `--[[ ... ]]`                                |
| YAML, shell, others | A warning, nothing changes (no block syntax) |

> [!TIP]
> To uncomment a `gb` block, run the same command over the same lines: `gbip` again, or select them and press `gb`. `.` repeats and `u` undoes in one step, for both `gc` and `gb`.

> [!NOTE]
> `gb` works on whole lines only and does not nest: if the lines already contain `*/`, the new comment ends early. Help: `:help commenting`, `:help 'comments'`.
