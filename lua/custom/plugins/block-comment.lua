-- Block comments (/* ... */) to go with Neovim's built-in line comments (`gc`, `gcc`, see `:help commenting`)
-- No plugin: the markers come from each filetype's 'comments' option, which Neovim already sets
-- for SQL, C, C++, JavaScript, CSS and more. Filetypes without block comments (YAML, shell) show a warning.
--   gbc        toggle a block comment on the current line (3gbc for 3 lines)
--   gb{motion} toggle a block comment over a motion, e.g. gbip
--   gb         (visual) toggle a block comment around the selected lines
-- Works on whole lines: /* goes before the first line's text and */ after the last line's text.

local M = {}

-- Filetypes whose block comment is missing from 'comments' (or where a different one is wanted)
local overrides = {
  lua = { '--[[', ']]' },
}

-- 'comments' looks like "s1:/*,mb:*,ex:*/,://". A block comment is an entry with the `s` (start) flag
-- followed later by one with the `e` (end) flag. Starts containing spaces are skipped: those are
-- list-style doc comment entries, like C's "sO:* -".
local function markers()
  if overrides[vim.bo.filetype] then return unpack(overrides[vim.bo.filetype]) end
  local start
  for part in vim.gsplit(vim.bo.comments, ',', { plain = true }) do
    local flags, str = part:match '^([^:]*):(.*)$'
    if flags and flags:find 's' and not str:find '%s' then
      start = str
    elseif flags and flags:find 'e' and start then
      return start, str
    end
  end
end

local function toggle(l1, l2)
  local open, close = markers()
  if not open then
    vim.notify('No block comment for filetype "' .. vim.bo.filetype .. '"', vim.log.levels.WARN)
    return
  end

  local lines = vim.api.nvim_buf_get_lines(0, l1 - 1, l2, false)
  local first_pat = '^(%s*)' .. vim.pesc(open) .. ' ?(.*)$'
  local last_pat = '^(.-) ?' .. vim.pesc(close) .. '%s*$'

  if lines[1]:match(first_pat) and lines[#lines]:match(last_pat) then
    -- Remove the markers (and the single space next to each)
    lines[1] = table.concat { lines[1]:match(first_pat) }
    lines[#lines] = lines[#lines]:match(last_pat)
  else
    local indent, text = lines[1]:match '^(%s*)(.*)$'
    lines[1] = indent .. open .. (text ~= '' and ' ' .. text or '')
    lines[#lines] = lines[#lines] .. (lines[#lines]:match '%S' and ' ' or '') .. close
  end

  -- One call, so it is a single undo step
  vim.api.nvim_buf_set_lines(0, l1 - 1, l2, false, lines)
end

-- Called by `g@` with the '[ and '] marks set to the motion or visual selection
function M.operator()
  toggle(vim.api.nvim_buf_get_mark(0, '[')[1], vim.api.nvim_buf_get_mark(0, ']')[1])
end

-- Going through `g@` (like the built-in `gc`) gives motions, counts, visual mode and `.` repeat for free
local function start_operator()
  vim.o.operatorfunc = "v:lua.require'custom.plugins.block-comment'.operator"
  return 'g@'
end

vim.keymap.set({ 'n', 'x' }, 'gb', start_operator, { expr = true, desc = 'Toggle block comment' })
vim.keymap.set('n', 'gbc', function() return start_operator() .. '_' end, { expr = true, desc = 'Toggle block comment on line' })

return M
