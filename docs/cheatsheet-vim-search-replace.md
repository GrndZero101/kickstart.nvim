# Cheatsheet: Search and Replace

## Search (normal mode)

| Key                 | Action                                                      |
| ------------------- | ----------------------------------------------------------- |
| `/pat` / `?pat`     | Search forward / backward                                   |
| `n` / `N`           | Next / previous match                                       |
| `*` / `#`           | Search whole word under cursor forward / backward           |
| `g*` / `g#`         | Same, but partial words match too                           |
| `<Esc>`             | Clear highlight (mapped here to `:nohlsearch`)              |
| `/\cpat` / `/\Cpat` | Force ignore / match case                                   |
| `/\vpat`            | "Very magic": regex like most other tools (`(a\|b)`, `\d+`) |

Case rule here: `ignorecase` plus `smartcase`, so lowercase is case-insensitive, and any capital makes it case-sensitive.

## Substitute `:s`

Form: `:[range]s/pattern/replacement/[flags]`

| Command                   | Action                                                              |
| ------------------------- | ------------------------------------------------------------------- |
| `:s/a/b/`                 | First `a` on the current line                                       |
| `:s/a/b/g`                | All on the current line                                             |
| `:%s/a/b/g`               | All in the file                                                     |
| `:%s/a/b/gc`              | All, confirming each (`y n a q l`)                                  |
| `:5,12s/a/b/g`            | Lines 5 to 12                                                       |
| `:'<,'>s/a/b/g`           | The visual selection (typed automatically after `:` in visual mode) |
| `:%s/\<word\>/new/g`      | Whole word only                                                     |
| `:%s//new/g`              | Reuse the last search pattern                                       |
| `:%s/a/b/gn`              | Only **count** matches                                              |
| `:%s#/usr/bin#/opt/bin#g` | Any delimiter, handy for paths                                      |
| `&` / `g&`                | Repeat last `:s` on line / on whole file                            |

Flags: `g` all in line, `c` confirm, `i` ignore case, `n` count only, `e` no error if nothing matches.

## In the replacement

| Token         | Meaning                                         |
| ------------- | ----------------------------------------------- |
| `&`           | The whole match                                 |
| `\1` ... `\9` | Capture group (`\(...\)`, or `(...)` with `\v`) |
| `\r`          | Newline (not `\n`)                              |
| `\n`          | In the **pattern**: a newline                   |
| `\u` / `\U`   | Uppercase next char / rest                      |

## Global commands

| Command            | Action                                          |
| ------------------ | ----------------------------------------------- |
| `:g/pat/d`         | Delete all lines matching                       |
| `:v/pat/d`         | Delete all lines **not** matching               |
| `:g/pat/normal A;` | Run a normal-mode command on each matching line |
| `:g/pat/s/a/b/g`   | Substitute only on matching lines               |
| `:%s/\s\+$//e`     | Trim trailing whitespace                        |

> [!TIP]
> Two good workflows. (1) `*` on a word, then `:%s//new/g`. (2) `*`, `cgn`, type the new text, `<Esc>`, then `.` repeatedly to accept each match, or `n` to skip one. Neovim previews `:s` live as you type it.

> [!WARNING]
> `:%s` and `:g` act on the whole file. `u` undoes it in one step. Use `c` or a range if you are unsure. In Telescope, `<leader>sg` finds across files, but replacing there needs quickfix (`:cdo`), not yet covered.

> [!NOTE]
> Help: `:help :s`, `:help pattern`, `:help :g`.
