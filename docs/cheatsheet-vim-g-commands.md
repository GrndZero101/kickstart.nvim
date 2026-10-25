# Cheatsheet: `g` Commands

`g` is the "extra commands" prefix. Normal mode unless noted. Press `g` and pause to see these in which-key.

## Move

| Key                | Action                                              |
| ------------------ | --------------------------------------------------- |
| `gg`               | First line (`G` = last line, `5G` / `5gg` = line 5) |
| `gj` / `gk`        | Down / up by **screen** line (wrapped lines)        |
| `g0` / `g^` / `g$` | Start / first non-blank / end of screen line        |
| `ge` / `gE`        | Back to end of previous word / WORD                 |
| `gm` / `gM`        | Middle of screen line / of text line                |
| `go`               | Go to byte offset (`:goto`)                         |
| `g;` / `g,`        | Older / newer position in the change list           |
| `gi`               | Back to last insert position, enter insert mode     |
| `gI`               | Insert at column 1 (ignores indent)                 |
| `gv`               | Reselect last visual selection                      |
| `gt` / `gT`        | Next / previous tab page                            |

## Edit and case

| Key                         | Action                                                              |
| --------------------------- | ------------------------------------------------------------------- |
| `gu{motion}` / `gU{motion}` | Lowercase / UPPERCASE (`guu`, `gUU` = line)                         |
| `g~{motion}`                | Toggle case                                                         |
| `g?{motion}`                | ROT13                                                               |
| `gJ`                        | Join lines without adding a space                                   |
| `gq{motion}`                | Format (wrap) text to `textwidth`; `gqq` = line, `gqip` = paragraph |
| `gw{motion}`                | Same as `gq` but cursor stays put                                   |
| `g&`                        | Repeat last `:s` on whole file                                      |
| `gp` / `gP`                 | Paste and leave cursor after the pasted text                        |
| `g<C-a>` / `g<C-x>`         | (visual) Increment / decrement as a sequence                        |

## Files, search, info

| Key         | Action                                                 |
| ----------- | ------------------------------------------------------ |
| `gf`        | Open file path under cursor                            |
| `gF`        | Open file at `file:line` under cursor                  |
| `gx`        | Open URL / path under cursor with the system handler   |
| `gd` / `gD` | Go to local / global definition (text-based, not LSP)  |
| `gn` / `gN` | Select next / previous search match (then `c`, `d`...) |
| `ga`        | Show character code under cursor                       |
| `g8`        | Show UTF-8 bytes under cursor                          |
| `g<`        | Show output of the last command                        |

## Neovim additions

| Key                   | Action                                                                  |
| --------------------- | ----------------------------------------------------------------------- |
| `gc{motion}` / `gcc`  | Toggle comment (built in, 0.10+). Also `gc` in visual mode              |
| `grn` / `gra`         | LSP rename / code action                                                |
| `grr` / `gri` / `grt` | References / implementation / type definition (Telescope when attached) |
| `grd`                 | Definition (Telescope, this config)                                     |
| `gO`                  | Document symbols (outline)                                              |

> [!TIP]
> `gn` combines with operators: `cgn` changes the next match, then `.` repeats on the next one. It's a quick alternative to `:%s`.

> [!NOTE]
> `gq` uses `textwidth` (0 by default, so it wraps at 79). `gd` stays text-based; use `grd` for the LSP definition. Help: `:help g`.
