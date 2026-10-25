# Cheatsheet: Change and Text Objects

`c` = delete, then enter insert mode. Grammar: **`c` + text object or motion**. `i` = _inside_ (contents), `a` = _around_ (contents plus delimiters). Normal mode.

## Text objects

| Object             | Selects                                  |
| ------------------ | ---------------------------------------- |
| `iw` / `aw`        | Word (`aw` adds trailing space)          |
| `iW` / `aW`        | WORD (non-blank run)                     |
| `is` / `as`        | Sentence                                 |
| `ip` / `ap`        | Paragraph (`ap` adds blank line)         |
| `i"` `i'` `` i` `` | Inside quotes (`a"` includes the quotes) |
| `i(` `i)` `ib`     | Inside parentheses                       |
| `i[` `i]`          | Inside brackets                          |
| `i{` `i}` `iB`     | Inside braces                            |
| `i<` `i>`          | Inside angle brackets                    |
| `it` / `at`        | Inside / around an HTML or XML tag       |

## Change recipes

| Keys                  | Action                                                            |
| --------------------- | ----------------------------------------------------------------- |
| `ciw`                 | Change the word under the cursor                                  |
| `ci"`                 | Change inside quotes (cursor can be before the quote on the line) |
| `ca"`                 | Change quotes and contents                                        |
| `ci(` / `ci{` / `ci[` | Change contents of the bracket pair                               |
| `cit`                 | Change inside the tag                                             |
| `cip`                 | Change the paragraph                                              |
| `ct{c}`               | Change up to character `c` (`ct,` `ct)`)                          |
| `cf{c}`               | Change through character `c`                                      |
| `c$` / `C`            | Change to end of line                                             |
| `c0` / `c^`           | Change to line start / first non-blank                            |
| `cc` / `S`            | Change the whole line, keeping indent                             |
| `cw`                  | Change to end of word                                             |
| `c/pat<CR>`           | Change up to the next match                                       |
| `cgn`                 | Change next search match, then `.` for the next                   |
| `c2i(`                | Change inside the 2nd enclosing parentheses                       |

## Single-key changes

| Key    | Action                                         |
| ------ | ---------------------------------------------- |
| `s`    | Delete char, insert                            |
| `r{c}` | Replace one char (stay in normal mode)         |
| `R`    | Replace mode: type over text, `<Esc>` to leave |
| `~`    | Toggle case of the char, move right            |
| `J`    | Join with next line                            |
| `.`    | Repeat last change                             |

> [!TIP]
> The same objects work with every operator and in visual mode: `yi"`, `di(`, `vip`, `>ip`, `gUiw`. Learn the objects once and they apply everywhere. Change a value, then move on and press `.` to repeat.

> [!NOTE]
> Plain `cw` behaves like `ce`: it stops at the end of the word without taking trailing space. Text objects use the nearest enclosing pair, so `ci(` works from anywhere inside the parentheses. Help: `:help text-objects`.
