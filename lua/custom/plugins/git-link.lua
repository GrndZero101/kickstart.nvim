-- gitlinker: copy or open a permalink to the current line (or selected lines) on GitHub, GitLab, etc.
-- https://github.com/linrongbin16/gitlinker.nvim
--
--   <leader>cu  copy the permalink    https://github.com/<org>/<repo>/blob/<commit>/init.lua?plain=1#L12-L18
--   <leader>co  open it in the browser
--
-- Links are pinned to a commit, so they keep pointing at the same lines after the file changes. The
-- commit is the newest one that exists on the remote (your branch's upstream first, then HEAD and
-- the 50 commits before it), so unpushed work links to the last pushed version and the plugin warns
-- when the file has changed since then.
--
-- Remote: with more than one remote (this repo has origin + upstream) gitlinker always pops up a
-- "select remote" picker, even when the branch tracks one. The keys below pick it instead: the
-- current branch's remote, else `origin`, and only fall back to the picker when neither exists.
--
-- More from the command line: `:GitLink blame` (blame view), `:GitLink default_branch` (link to
-- master/main instead of a commit), `:GitLink remote=upstream`. The plugin's README has the rest.

vim.pack.add { { src = 'https://github.com/linrongbin16/gitlinker.nvim', version = vim.version.range '*' } }
require('gitlinker').setup {}

-- The remote of the repo holding the current file: its branch's remote, else origin, else nil.
local function pick_remote()
  local dir = vim.fn.expand '%:p:h'
  if dir == '' then return nil end
  local function git(...)
    local result = vim.system({ 'git', '-C', dir, ... }, { text = true }):wait()
    return result.code == 0 and vim.trim(result.stdout) or nil
  end
  local branch = git('symbolic-ref', '--quiet', '--short', 'HEAD') -- nil on a detached HEAD
  local remote = branch and git('config', 'branch.' .. branch .. '.remote')
  if remote and remote ~= '.' then return remote end -- '.' means it tracks a local branch
  local remotes = git 'remote'
  if remotes and vim.tbl_contains(vim.split(remotes, '\n'), 'origin') then return 'origin' end
end

local function link(opts)
  return function() require('gitlinker').link(vim.tbl_extend('keep', opts, { remote = pick_remote() })) end
end

-- In visual mode both keys link the selected line range.
vim.keymap.set({ 'n', 'x' }, '<leader>cu', link {}, { desc = '[C]opy git permalink [U]RL' })
vim.keymap.set({ 'n', 'x' }, '<leader>co', link { action = require('gitlinker.actions').open }, { desc = '[O]pen git permalink in browser' })
