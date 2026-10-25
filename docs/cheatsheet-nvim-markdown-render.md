# Cheatsheet: Markdown Rendering

Plugin: `render-markdown.nvim` (in `init.lua`). Renders headings, tables, code blocks, checkboxes and alerts in the buffer.

## Commands (normal mode)

| Key / Command                         | Action                                      |
| ------------------------------------- | ------------------------------------------- |
| `<leader>tm`                          | Toggle rendering on / off                   |
| `:RenderMarkdown buf_toggle`          | Toggle for this buffer only                 |
| `:RenderMarkdown expand` / `contract` | Show more / less raw text around the cursor |

## Behaviour

| Mode                      | View         |
| ------------------------- | ------------ |
| Normal, command, terminal | Rendered     |
| Insert, visual            | Raw Markdown |

> [!TIP]
> Enter insert mode (`i`) to see and edit the raw text, then `<Esc>` to return to the rendered view.

> [!NOTE]
> Only `markdown` files are rendered. Icons need a Nerd Font (`vim.g.have_nerd_font`). Help: `:help render-markdown`.
