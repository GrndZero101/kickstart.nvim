-- Dual line numbers: absolute and relative side by side, toggled with <leader>tn. Off by default.
--
-- The default (from init.lua) is hybrid: 'number' + 'relativenumber' show the absolute number on the
-- cursor line and relative distances everywhere else. Turning dual on draws both columns on every line,
-- which helps when sharing your screen or matching line numbers from error, lint or `terraform plan` output.
--
--   off (hybrid)      on (dual)
--     2                10   2
--     1                11   1
--    12                12
--     1                13   1
--
-- It works through 'statuscolumn' (see `:help 'statuscolumn'`): %s keeps the sign column (git signs,
-- diagnostics), %= right-aligns the numbers, and v:virtnum blanks the numbers on wrapped screen lines.
-- Windows with numbers turned off (neo-tree, help, terminals) get an empty column, so they stay unchanged.

local dual = "%{%&number || &relativenumber ? '%s%=' .. (v:virtnum ? '' : printf('%d %3s', v:lnum, v:relnum ? v:relnum : '')) .. ' ' : ''%}"

local function toggle_dual_numbers()
  local value = vim.go.statuscolumn == '' and dual or ''
  vim.go.statuscolumn = value -- default for windows opened later
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    vim.wo[win].statuscolumn = value -- windows that are already open
  end
end

vim.keymap.set('n', '<leader>tn', toggle_dual_numbers, { desc = '[T]oggle dual line [N]umbers' })
