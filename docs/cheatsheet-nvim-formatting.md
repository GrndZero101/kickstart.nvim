# Cheatsheet: Formatting and Indentation

Formatter: `conform.nvim` in `init.lua`. Indentation defaults: `lua/custom/plugins/indentation.lua`.

## Format (normal or visual mode)

| Key / Command  | Action                                          |
| -------------- | ----------------------------------------------- |
| `<leader>f`    | Format the whole file                           |
| `<leader>f`    | In visual mode, format only the selected lines  |
| `:w`           | Formats on save for the file types listed below |
| `:ConformInfo` | Show which formatter runs for the current file  |

| File type        | Formatter                      |
| ---------------- | ------------------------------ |
| Python           | ruff (format and sort imports) |
| Shell            | shfmt                          |
| Markdown         | prettier                       |
| Lua              | stylua                         |
| JSON, YAML, TOML | Their language servers         |

## Indentation (normal mode)

| Key / Command  | Action                                              |
| -------------- | --------------------------------------------------- |
| `>>` / `<<`    | Indent / unindent the line (visual: `>` / `<`)      |
| `={motion}`    | Re-indent, e.g. `=ap` paragraph, `gg=G` whole file  |
| `:set et? sw?` | Show whether spaces are used, and the indent width  |
| `:retab`       | Convert existing tabs to the current spaces setting |

Defaults are spaces: 2 for JSON, YAML, TOML, Markdown, shell and Lua, and 4 for Python and everything else.

> [!NOTE]
> A project's `.editorconfig` wins over these defaults. Next, guess-indent copies the style of a file that is already indented. The defaults only apply to new files and files with no indentation yet. Makefiles and Go keep tabs. Help: `:help editorconfig`, `:help 'expandtab'`.
