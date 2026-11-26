-- Copy the current file's path to the system clipboard. The keys match Yazi's copy keys
-- (cc / cd / cf / cn) behind <leader>, so the same muscle memory works in both places.
--
--   <leader>cc  full path               C:\shares\...\lua\custom\plugins\yazi.lua
--   <leader>cd  directory               C:\shares\...\lua\custom\plugins
--   <leader>cf  file name               yazi.lua
--   <leader>cn  name without extension  yazi
--   <leader>cr  relative to cwd         lua\custom\plugins\yazi.lua   (no Yazi equivalent)
--   <leader>cg  relative to git root    lua\custom\plugins\yazi.lua   (no Yazi equivalent)
--   <leader>cl  git path + line(s)      lua\custom\plugins\yazi.lua:42  /  ...yazi.lua:12-18 from a selection
--
-- <leader>cl is for pointing Claude, a teammate or a CI log at an exact spot. Outside a git repo it falls
-- back to the path from the working directory. GitHub permalinks live in git-link.lua (<leader>cu / co).
--
-- <leader>cg finds the repo from the file itself (the nearest folder above it holding .git), not from
-- Neovim's working directory, so it works however Neovim was started. Outside a repo it warns instead.
-- The search checks at most `max_git_levels` folders upward, so a file outside any repo (or on a slow
-- network path) never walks all the way to the drive root. Raise it if a repo is nested deeper than that.
--
-- Writes to "+ directly, so it works whatever 'clipboard' is set to. Buffers with no file
-- (unnamed, neo-tree, terminals, help) are skipped with a warning instead of copying junk.
-- On Windows, files opened through some pickers keep forward slashes (C:\nvim/lua/...), so the
-- separators are made consistent: backslashes, or forward slashes if 'shellslash' is set.

local use_backslash = vim.fn.has 'win32' == 1

-- `get_path` returns the path to copy, or nil plus a warning message.
local function copy_path(get_path, label)
  if type(get_path) == 'string' then
    local modifier = get_path
    get_path = function() return vim.fn.expand('%' .. modifier) end
  end
  return function()
    if vim.fn.expand '%' == '' or vim.bo.buftype ~= '' then
      vim.notify('No file in this buffer', vim.log.levels.WARN)
      return
    end
    local path, err = get_path()
    if not path then
      vim.notify(err, vim.log.levels.WARN)
      return
    end
    if use_backslash and not vim.o.shellslash then path = path:gsub('/', '\\') end
    vim.fn.setreg('+', path)
    vim.notify('Copied ' .. label .. ': ' .. path)
  end
end

local max_git_levels = 20 -- backstop: folders checked upward from the file, including its own

-- Nearest folder above `file` holding '.git' (a folder in a normal repo, a file in worktrees/submodules).
local function find_git_root(file)
  local dir = vim.fs.dirname(file)
  for _ = 1, max_git_levels do
    if vim.uv.fs_stat(vim.fs.joinpath(dir, '.git')) then return dir end
    local parent = vim.fs.dirname(dir)
    if parent == dir then return nil, 'Not inside a git repo' end -- reached the drive root
    dir = parent
  end
  return nil, ('No git repo within %d folders of this file'):format(max_git_levels)
end

local function git_relative_path()
  local file = vim.fs.normalize(vim.fn.expand '%:p')
  local root, err = find_git_root(file)
  if not root then return nil, err end
  local rel = vim.fs.relpath(root, file)
  if not rel then return nil, 'Could not work out the path from git root ' .. root end
  return rel
end

-- Git path (or cwd-relative outside a repo) plus the cursor line, or the selected line range.
local function path_with_lines()
  local path = git_relative_path() or vim.fn.expand '%:.'
  local first, last = vim.fn.line 'v', vim.fn.line '.' -- the same line in normal mode
  if first > last then
    first, last = last, first
  end
  if vim.fn.mode():match '^[vV\22]' then
    vim.api.nvim_feedkeys(vim.keycode '<Esc>', 'n', false) -- leave visual mode, as a yank would
  end
  return path .. ':' .. (first == last and first or first .. '-' .. last)
end

require('which-key').add { { '<leader>c', group = '[C]opy path or link', mode = { 'n', 'x' } } }
vim.keymap.set('n', '<leader>cc', copy_path(':p', 'full path'), { desc = '[C]opy full path' })
vim.keymap.set('n', '<leader>cd', copy_path(':p:h', 'directory'), { desc = '[C]opy [D]irectory' })
vim.keymap.set('n', '<leader>cf', copy_path(':t', 'file name'), { desc = '[C]opy [F]ile name' })
vim.keymap.set('n', '<leader>cn', copy_path(':t:r', 'name'), { desc = '[C]opy [N]ame without extension' })
vim.keymap.set('n', '<leader>cr', copy_path(':.', 'relative path'), { desc = '[C]opy [R]elative path' })
vim.keymap.set('n', '<leader>cg', copy_path(git_relative_path, 'git path'), { desc = '[C]opy path from [G]it root' })
vim.keymap.set({ 'n', 'x' }, '<leader>cl', copy_path(path_with_lines, 'path and line'), { desc = '[C]opy path with [L]ine number' })
