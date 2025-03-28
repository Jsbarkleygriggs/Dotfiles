-- Ensure that Telescope is loaded
local telescope_ok, builtin = pcall(require, 'telescope.builtin')
if not telescope_ok then
  vim.notify("Error loading Telescope: " .. tostring(builtin), vim.log.levels.ERROR)
  return
end

-- Key mappings for Telescope
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- zoxide extension binding
vim.keymap.set("n", "<leader>cd", require('telescope').extensions.zoxide.list)

-- Override default behavior and theme for current buffer fuzzy find
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local telescope = require('telescope.builtin')
local lsp = vim.lsp

-- LSP Mappings
local function lsp_keymaps(bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
  map('gr', telescope.lsp_references, '[G]oto [R]eferences')
  map('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')
  map('<leader>D', telescope.lsp_type_definitions, 'Type [D]efinition')
  map('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  map('<leader>rn', lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', lsp.buf.code_action, '[C]ode [A]ction')
  map('K', lsp.buf.hover, 'Hover Documentation')
  map('gD', lsp.buf.declaration, '[G]oto [D]eclaration')
end

-- Set up autocommand for LSP Attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    lsp_keymaps(event.buf)

    local client = lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = lsp.buf.clear_references,
      })
    end
  end,
})
