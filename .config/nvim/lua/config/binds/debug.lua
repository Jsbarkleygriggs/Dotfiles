local dap = require 'dap'
local keymap_opts = { noremap = true, silent = true }

-- Basic debugging keymaps
vim.keymap.set('n', '<F5>', dap.continue, vim.tbl_extend('force', keymap_opts, { desc = 'Debug: Start/Continue' }))
vim.keymap.set('n', '<M-i>', dap.step_into, vim.tbl_extend('force', keymap_opts, { desc = 'Debug: Step Into' }))
vim.keymap.set('n', '<M-p>', dap.step_over, vim.tbl_extend('force', keymap_opts, { desc = 'Debug: Step Over' }))
vim.keymap.set('n', '<M-o>', dap.step_out, vim.tbl_extend('force', keymap_opts, { desc = 'Debug: Step Out' }))
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, vim.tbl_extend('force', keymap_opts, { desc = 'Debug: Toggle Breakpoint' }))
vim.keymap.set('n', '<leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, vim.tbl_extend('force', keymap_opts, { desc = 'Debug: Set Breakpoint' }))

-- Toggle DAP UI
vim.keymap.set('n', '<F7>', require('dapui').toggle, vim.tbl_extend('force', keymap_opts, { desc = 'Debug: See last session result.' }))

