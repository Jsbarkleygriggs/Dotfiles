-- Actions
-- Visual mode
vim.keymap.set('v', '<leader>hs', function()
  gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, vim.tbl_extend('force', keymap_opts, { desc = 'Stage git hunk' }))

vim.keymap.set('v', '<leader>hr', function()
  gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, vim.tbl_extend('force', keymap_opts, { desc = 'Reset git hunk' }))

-- Normal mode
vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, vim.tbl_extend('force', keymap_opts, { desc = 'Git [s]tage hunk' }))
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, vim.tbl_extend('force', keymap_opts, { desc = 'Git [r]eset hunk' }))
vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, vim.tbl_extend('force', keymap_opts, { desc = 'Git [S]tage buffer' }))
vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk, vim.tbl_extend('force', keymap_opts, { desc = 'Git [u]ndo stage hunk' }))
vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer, vim.tbl_extend('force', keymap_opts, { desc = 'Git [R]eset buffer' }))
vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, vim.tbl_extend('force', keymap_opts, { desc = 'Git [p]review hunk' }))
vim.keymap.set('n', '<leader>hb', gitsigns.blame_line, vim.tbl_extend('force', keymap_opts, { desc = 'Git [b]lame line' }))
vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, vim.tbl_extend('force', keymap_opts, { desc = 'Git [d]iff against index' }))
vim.keymap.set('n', '<leader>hD', function()
  gitsigns.diffthis '@'
end, vim.tbl_extend('force', keymap_opts, { desc = 'Git [D]iff against last commit' }))

-- Toggles
vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, vim.tbl_extend('force', keymap_opts, { desc = '[T]oggle git show [b]lame line' }))
vim.keymap.set('n', '<leader>tD', gitsigns.toggle_deleted, vim.tbl_extend('force', keymap_opts, { desc = '[T]oggle git show [D]eleted' }))

