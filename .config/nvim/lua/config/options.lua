-- See `:help vim.opt`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Enable mouse mode, can be useful for resizing splits for example!
--vim.opt.mouse = 'a'

-- Hide mode
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Indentation
vim.opt.shiftwidth = 4    -- Sets indent size to 4 spaces
vim.opt.tabstop = 4       -- Sets tab size to 4 spaces
vim.opt.expandtab = true  -- Converts tabs to spaces

-- Line wrapping
vim.opt.wrap = false      -- Default to no line wrapping
vim.opt.linebreak = true  -- When wrap is true, it won't break up words

-- Config Syntax Highlighting
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*/hypr/*.conf"},
    command = "set filetype=hyprlang"
}) -- or just add vim: ft=hyprlang to the files themselves

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*/i3/*.conf"},
    command = "set filetype=i3config"
})
