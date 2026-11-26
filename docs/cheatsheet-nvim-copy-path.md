# Cheatsheet: Copy File Path

Copy the current file's path, or a link to it, to the system clipboard, ready to paste into a terminal, Explorer, a chat or a prompt. The first four keys are Yazi's copy keys (`cc` / `cd` / `cf` / `cn`) behind `<leader>`, so the same muscle memory works in the editor and in Yazi. They come from `lua/custom/plugins/copy-path.lua` (paths) and `lua/custom/plugins/git-link.lua` (links, using the gitlinker.nvim plugin).

## Paths

| Key          | Copies                             | Example                                     | In Yazi |
| ------------ | ---------------------------------- | ------------------------------------------- | ------- |
| `<leader>cc` | Full path                          | `C:\shares\...\lua\custom\plugins\yazi.lua` | `cc`    |
| `<leader>cd` | Directory                          | `C:\shares\...\lua\custom\plugins`          | `cd`    |
| `<leader>cf` | File name                          | `yazi.lua`                                  | `cf`    |
| `<leader>cn` | Name without extension             | `yazi`                                      | `cn`    |
| `<leader>cr` | Path relative to working directory | `lua\custom\plugins\yazi.lua`               | `<C-y>` |
| `<leader>cg` | Path relative to the git repo root | `lua\custom\plugins\yazi.lua`               |         |
| `<leader>cl` | Git path with line number(s)       | `init.lua:42`, or `init.lua:12-18` (visual) |         |

A message at the bottom of the screen shows what was copied.

> [!TIP]
> Use `<leader>cg` for git commands, PRs and prompts. It finds the repo from the file itself, so it gives the same answer wherever Neovim was started. `<leader>cr` depends on the working directory: from a subfolder it gives a shorter path, and outside it falls back to the full path. A file that is not in a git repo gets a warning from `<leader>cg`. The search for `.git` checks at most 20 folders upward from the file, then gives up, so it never crawls a deep path or a slow network drive all the way to the root. Change `max_git_levels` in the Lua file if a repo is nested deeper.

> [!TIP]
> `<leader>cl` points Claude, a teammate or a CI log at an exact spot. Select lines with `V` first to copy a range. Outside a git repo it uses the path from the working directory instead.

## Links (GitHub, GitLab, ...)

| Key          | Action                                          | Example                                                   |
| ------------ | ----------------------------------------------- | --------------------------------------------------------- |
| `<leader>cu` | Copy a permalink to the line, or selected lines | `https://github.com/.../blob/bd18d39.../init.lua#L12-L18` |
| `<leader>co` | Open that permalink in the browser              |                                                           |

More from the command line: `:GitLink blame` copies a link to the blame view, and `:GitLink default_branch` links to `master` / `main` instead of a commit. Add `!` (`:GitLink! blame`) to open the link instead of copying it.

> [!NOTE]
> Permalinks are pinned to a commit, so they keep pointing at the same lines after the file changes. The commit is the newest one already pushed, so a link made from unpushed work points at the last pushed version, and gitlinker warns when the file has changed since then. Push first if the lines you are linking are new. The remote is your branch's remote, else `origin`. A picker only appears when neither exists.

> [!NOTE]
> Buffers with no file (a new unnamed buffer, neo-tree, terminals, help) are skipped with a warning. `<leader>cw` in the same menu is not a copy key: it opens Yazi in the working directory. Without the mappings: `:let @+ = expand('%:p')` copies the full path, and `1<C-g>` shows it without copying. Help: `:help expand()`, `:help filename-modifiers`.
