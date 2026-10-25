# Cheatsheet: Registers (`"`)

Registers are named clipboards. Prefix a command with `"{reg}`: `"ayy` yanks a line into `a`, `"ap` pastes it. View them with `:registers` (`:reg`).

## Common registers

| Register    | Holds                                                    |
| ----------- | -------------------------------------------------------- |
| `""`        | Unnamed: default for `y`, `d`, `c`, `p`                  |
| `"0`        | Last **yank** (not overwritten by deletes)               |
| `"1`-`"9`   | Last deletes of a line or more, newest in `"1`           |
| `"-`        | Last small delete (less than a line)                     |
| `"a`-`"z`   | Yours. Uppercase (`"Ayy`) **appends**                    |
| `"_`        | Black hole: discards (`"_dd` deletes without clobbering) |
| `"+` / `"*` | System clipboard / selection                             |

## Read-only registers

| Register | Holds               |
| -------- | ------------------- |
| `".`     | Last inserted text  |
| `":`     | Last command line   |
| `"/`     | Last search pattern |
| `"%`     | Current file name   |
| `"#`     | Alternate file name |

## Using registers

| Key                         | Action                                          |
| --------------------------- | ----------------------------------------------- |
| `"{reg}y` / `"{reg}p`       | Yank into / paste from a register               |
| `<C-r>{reg}`                | Paste a register in insert or command-line mode |
| `<C-r><C-w>`                | (command line) Paste the word under the cursor  |
| `"=`                        | Expression register: `"=5*5<CR>p` pastes `25`   |
| `:reg a b`                  | Show only registers `a` and `b`                 |
| `q{reg}` ... `q` / `@{reg}` | Record / run a macro, stored in a register      |
| `@@`                        | Repeat last macro                               |

> [!TIP]
> Pasting over a selection loses your yank (the replaced text lands in `""`). Yank to `"0` first and paste with `"0p`, or delete to the black hole with `"_d`.

> [!NOTE]
> This config sets `clipboard=unnamedplus`, so the unnamed register is synced with `"+`: yanks and deletes reach the OS clipboard. On Windows this works natively; on WSL it needs `wl-clipboard`. Help: `:help registers`.
