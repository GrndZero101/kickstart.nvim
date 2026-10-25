# Cheatsheet: Operators and `d`

Vim's grammar: **operator + motion/text object**. `d` is the delete operator, and every operator below works the same way. Normal mode.

## `d` (delete)

| Key               | Action                                         |
| ----------------- | ---------------------------------------------- |
| `dd`              | Delete line                                    |
| `D` (`d$`)        | Delete to end of line                          |
| `dw` / `db`       | Delete to next word start / back to word start |
| `d}` / `d{`       | Delete to next / previous blank line           |
| `dt{c}` / `df{c}` | Delete up to / including character `c`         |
| `d/pat<CR>`       | Delete up to the next match                    |
| `dgg` / `dG`      | Delete to top / bottom of file                 |
| `d%`              | Delete to matching bracket                     |
| `x` / `X`         | Delete char under / before cursor              |

## Text objects (`i` = inside, `a` = around)

| Object                             | Meaning                              |
| ---------------------------------- | ------------------------------------ |
| `iw` / `aw`                        | Word (`aw` includes trailing space)  |
| `is` / `as`                        | Sentence                             |
| `ip` / `ap`                        | Paragraph                            |
| `i"` / `a"` (also `'` and `` ` ``) | Quoted string                        |
| `i(` `i[` `i{` / `a(`...           | Bracket block (`ib`, `iB` also work) |
| `it` / `at`                        | HTML / XML tag                       |

Examples: `diw` delete word, `da"` delete string with quotes, `di(` empty parentheses, `dap` delete paragraph.

## Other operators (same grammar)

| Key                | Action                                                  |
| ------------------ | ------------------------------------------------------- |
| `c`                | Change (delete and enter insert mode); `cc`, `C`, `ciw` |
| `y`                | Yank; `yy`, `Y`, `yiw`                                  |
| `>` / `<`          | Indent / dedent; `>>`, `>ip`                            |
| `=`                | Auto-indent; `==`, `=ap`                                |
| `gu` / `gU` / `g~` | Lower / upper / toggle case                             |
| `gq`               | Format text                                             |
| `gc`               | Comment (Neovim 0.10+)                                  |
| `zf`               | Create a fold                                           |
| `!`                | Filter through a shell command (`!ip` then `sort<CR>`)  |

## Counts and repeat

| Key           | Action                 |
| ------------- | ---------------------- |
| `d3w` / `3dw` | Delete three words     |
| `3dd`         | Delete three lines     |
| `.`           | Repeat the last change |
| `u` / `<C-r>` | Undo / redo            |

> [!TIP]
> Doubling an operator acts on the line: `dd`, `yy`, `cc`, `>>`, `==`, `guu`. In visual mode, select first and then press the operator.

> [!NOTE]
> Deletes fill the registers `"1`-`"9` or `"-`. Use `"_d` to delete without touching them (see `cheatsheet-vim-registers.md`). Help: `:help operator`, `:help text-objects`.
