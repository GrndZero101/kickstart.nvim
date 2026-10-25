# Cheatsheet: Motions

Motions move the cursor, and also pick the text an operator acts on (`d3w`, `y}`, `ct,`). Normal mode.

## Words

| Key                    | Action                                                           |
| ---------------------- | ---------------------------------------------------------------- |
| `w` / `b`              | Start of next / previous word                                    |
| `e` / `ge`             | End of this / previous word                                      |
| `W` / `B` / `E` / `gE` | Same, but a WORD is anything between spaces (`foo.bar()` is one) |

## Within a line

| Key             | Action                                    |
| --------------- | ----------------------------------------- |
| `0` / `^` / `$` | Line start / first non-blank / line end   |
| `g_`            | Last non-blank character                  |
| `f{c}` / `F{c}` | Jump **onto** next / previous `c` in line |
| `t{c}` / `T{c}` | Jump **before** next / after previous `c` |
| `;` / `,`       | Repeat last `f t F T` forward / backward  |
| `{n}\|`         | Go to column `n`                          |

## Lines, blocks, file

| Key                 | Action                                    |
| ------------------- | ----------------------------------------- |
| `gg` / `G` / `{n}G` | First / last / line `n`                   |
| `{` / `}`           | Previous / next blank line (paragraph)    |
| `(` / `)`           | Previous / next sentence                  |
| `%`                 | Jump to matching `( [ {` or `) ] }`       |
| `[[` / `]]`         | Previous / next top-level `{` in column 0 |
| `+` / `-`           | First non-blank of next / previous line   |
| `H` / `M` / `L`     | Top / middle / bottom of the screen       |
| `<C-d>` / `<C-u>`   | Half page down / up                       |
| `<C-f>` / `<C-b>`   | Full page down / up                       |
| `<C-e>` / `<C-y>`   | Scroll one line down / up, cursor stays   |

## Search and jump back

| Key               | Action                                              |
| ----------------- | --------------------------------------------------- |
| `*` / `#`         | Next / previous occurrence of the word under cursor |
| `n` / `N`         | Repeat search forward / backward                    |
| `<C-o>` / `<C-i>` | Older / newer position in the jump list             |
| `''`              | Back to the line before the last jump               |

> [!TIP]
> Line numbers here are **relative**: read the number beside the target line and type `7j` or `12k`. Prefix any motion with a count (`3w`, `2}`), and combine with operators: `d2}`, `y3j`.

> [!NOTE]
> `f` and `t` are the fastest way to cross a line: `dt)` deletes up to `)`, `cf,` changes through the comma. See `cheatsheet-vim-change.md`. Help: `:help motion.txt`.

> [!TIP]
> Precognition shows where `w`, `b`, `e`, `^`, `$` and `%` would land, on a faint line under the cursor. The gutter shows `gg`, `G`, `{` and `}`. Toggle it with `<leader>tp`, and turn it off once the motions are automatic.
