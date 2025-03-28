--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Improved kj navigation; goes by wrapped lines unless you tell it the relitive line number
vim.keymap.set({'n', 'v'}, 'j', 'v:count == 0 ? "gj" : "j"', { noremap = true, expr = true })
vim.keymap.set({'n', 'v'}, 'k', 'v:count == 0 ? "gk" : "k"', { noremap = true, expr = true })

-- Navigation bindings
vim.keymap.set('n', '<leader>n', ':Neotree<CR>', { desc = 'open file explorer' })

-- Splits
vim.keymap.set('n', '<leader>-', ':5split | term<CR>', { desc = 'open terminal below' })
vim.keymap.set('n', '<leader>\\', ':vsplit | term<CR>', { desc = 'open terminal right' })
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { desc = 'duplicate below' })
vim.keymap.set('n', '<leader>_', ':split<CR>', { desc = 'duplicate right' })

-- Envoke LLM
vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')

-- Colapse and open functions
  -- See fold.lua

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between (some) windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- alt hjkl are remapped to arrowkeys with keyd
vim.keymap.set('n', '<Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Additional options for live_grep
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Search Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
-- NEED TO FIX ^^^^

local gitsigns = require 'gitsigns'

local keymap_opts = { noremap = true, silent = true }

-- Navigation
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal { ']c', bang = true }
  else
    gitsigns.nav_hunk 'next'
  end
end, vim.tbl_extend('force', keymap_opts, { desc = 'Jump to next git [c]hange' }))

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal { '[c', bang = true }
  else
    gitsigns.nav_hunk 'prev'
  end
end, vim.tbl_extend('force', keymap_opts, { desc = 'Jump to previous git [c]hange' }))

require 'config.binds.debug'

