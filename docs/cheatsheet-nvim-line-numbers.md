# Cheatsheet: Line Numbers

The default is **hybrid**: the cursor line shows its absolute number, and every other line shows how far it is from the cursor. `<leader>tn` switches to **dual**, which shows both numbers on every line. Dual is off when Neovim starts. It comes from `lua/custom/plugins/line-numbers.lua`, which is part of this config, not a plugin.

| Key           | Action                                                |
| ------------- | ----------------------------------------------------- |
| `<leader>tn`  | Toggle dual line numbers (all windows) on / off       |
| `7j` / `12k`  | Jump using the relative number beside the target line |
| `:42` / `42G` | Jump to absolute line 42                              |

```text
  hybrid (default)        dual (<leader>tn)
    2  bucket = ...         10   2  bucket = ...
    1  tags = {             11   1  tags = {
   12    Env = "prod"       12        Env = "prod"    <- cursor line
    1  }                    13   1  }
```

> [!TIP]
> Turn dual on when sharing your screen or matching line numbers from an error message, linter, CI log or `terraform plan`. Turn it off again for more room in splits.

> [!NOTE]
> Hybrid mode is `number` + `relativenumber` in `init.lua`. Dual mode uses `'statuscolumn'`. Windows without line numbers (neo-tree, help, terminals) are not changed. Help: `:help 'statuscolumn'`, `:help number_relativenumber`.
