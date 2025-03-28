return {
  { -- theme
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
	variant = 'auto', -- auto, main, moon, or dawn
	dark_variant = 'main', -- main, moon, or dawn
	dim_inactive_windows = false,
	extend_background_behind_borders = true,

	enable = {
	  terminal = true,
	  legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
	  migrations = true, -- Handle deprecated options automatically
	},

	styles = {
	  bold = true,
	  italic = true,
	  transparency = false,
	},

	groups = {
	  border = 'muted',
	  link = 'iris',
	  panel = 'surface',

	  error = 'love',
	  hint = 'iris',
	  info = 'foam',
	  note = 'pine',
	  todo = 'rose',
	  warn = 'gold',

	  git_add = 'foam',
	  git_change = 'rose',
	  git_delete = 'love',
	  git_dirty = 'rose',
	  git_ignore = 'muted',
	  git_merge = 'iris',
	  git_rename = 'pine',
	  git_stage = 'iris',
	  git_text = 'rose',
	  git_untracked = 'subtle',

	  h1 = 'iris',
	  h2 = 'foam',
	  h3 = 'rose',
	  h4 = 'gold',
	  h5 = 'pine',
	  h6 = 'foam',
	},

	highlight_groups = {
	  -- Comment = { fg = "foam" },
	  -- VertSplit = { fg = "muted", bg = "muted" },
	},

	before_highlight = function(group, highlight, palette)
	  -- Disable all undercurls
	  -- if highlight.undercurl then
	  --     highlight.undercurl = false
	  -- end
	  --
	  -- Change palette colour
	  -- if highlight.fg == palette.pine then
	  --     highlight.fg = palette.foam
	  -- end
	end,
      }

      vim.cmd 'colorscheme rose-pine'
    end,
  },

  { -- bindings hinting
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'

    opts = {
      icons = {
	-- set icon mappings to true if you have a Nerd Font
	mappings = vim.g.have_nerd_font,
	-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
	-- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
	keys = vim.g.have_nerd_font and {} or {
	  Up = '<Up> ',
	  Down = '<Down> ',
	  Left = '<Left> ',
	  Right = '<Right> ',
	  C = '<C-…> ',
	  M = '<M-…> ',
	  D = '<D-…> ',
	  S = '<S-…> ',
	  CR = '<CR> ',
	  Esc = '<Esc> ',
	  ScrollWheelDown = '<ScrollWheelDown> ',
	  ScrollWheelUp = '<ScrollWheelUp> ',
	  NL = '<NL> ',
	  BS = '<BS> ',
	  Space = '<Space> ',
	  Tab = '<Tab> ',
	  F1 = '<F1>',
	  F2 = '<F2>',
	  F3 = '<F3>',
	  F4 = '<F4>',
	  F5 = '<F5>',
	  F6 = '<F6>',
	  F7 = '<F7>',
	  F8 = '<F8>',
	  F9 = '<F9>',
	  F10 = '<F10>',
	  F11 = '<F11>',
	  F12 = '<F12>',
	},
      },

      config = function()
      end,
    },
  },

  {  -- Folds
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    config = function()
      vim.o.foldcolumn = '0'
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', 'zp', function()
	local winid = require('ufo').peekFoldedLinesUnderCursor()
      end, { desc = 'Peek at fold' }
      )

      -- Option 3: treesitter as a main provider instead
      -- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
      -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
      --    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
      require('ufo').setup {
	provider_selector = function(bufnr, filetype, buftype)
	  return { 'treesitter', 'indent' }
	end,
      }
    end,
  },
}
