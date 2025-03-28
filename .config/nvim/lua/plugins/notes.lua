return{
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
          require("nvim-treesitter.configs").setup({
            ensure_installed = { "markdown" },
            highlight = { enable = true },
          })
        end,
      },
    },
    build = false,
    config = function()
      require("image").setup({
        backend = "kitty",
        processor = "magick_cli",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            floating_windows = false, -- if true, images will be rendered in floating markdown windows
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },

          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "norg" },
          },
          typst = {
            enabled = true,
            filetypes = { "typst" },
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },

        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        kitty_method = "normal",
        window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
      })
    end,
  },

  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    config = function()

      require('config.binds.notes')

      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.export"] = {},
          ["core.neorgcmd"] = {},
          ["core.integrations.image"] = {},
          ["core.latex.renderer"] = {
            config = {
              render_on_enter = true,
              scale = 0.8,
              debounce_ms = 100, -- default 200
              dpi = 150,  -- default 350
            },
          },
          ["core.esupports.indent"] = {
            config = {
              tweaks = {
                -- ordered_list1 = 0,
                -- ordered_list2 = 2,
                -- ordered_list3 = 4,
                unordered_list1 = 0,
                unordered_list2 = 2,
                unordered_list3 = 4,
                unordered_list4 = 6,
              }
            }
          },
          ["core.itero"] = {
            config = {
              iterables = {
                "unordered_list%d",
                "ordered_list%d",
                "quote%d",
                -- "heading%d" is removed from this list
              },
            },
          },
          ["core.ui"] = {},
          ["core.integrations.otter"] = {}, -- lsp stuff for code blocks WITHOUT looking glass
          ["core.ui.calendar"] = {},
          ["core.qol.toc"] = {},
          ["core.tangle"] = {},
          ["core.concealer"] = {
            config = {
              folds = true,
              icon_preset = "diamond",
              vim.cmd([[setlocal conceallevel=2]]),
              --vim.cmd([[setlocal concealcursor=nc]]),
            },
          },
        },
      })
    end,
  },

--  {
    --"jbyuki/nabla.nvim", -- Askii latex concealer in code blocks (will to need to fork for otter integration or direct neorg integration)
    --dependencies = { "nvim-tresitter/nvim-treesitter"},
    --config = function()
    --  vim.api.nvim_create_autocmd("FileType", {
    --    pattern = { "math", "latex"},
    --    callback = function()
    --      require('nabla').enable_virt({
    --        autogen = true,
    --      })
    --    end
    --  })
    --end,
--  },

  {
    "dhruvasagar/vim-table-mode",
    config = function ()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "table", "text", "markdown"},
        callback = function()
          vim.cmd([[TableModeEnable]])
        end,
      })
    end
  },

  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
    config = function ()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "neorg", "text", "markdown"},
        callback = function()
          local otter = require'otter'
          otter.activate()
        end,
      })
    end
  },

--  {
--    "jbyuki/quickmath.nvim", --fancy algebra (half works)
--    config = function ()
--      vim.api.nvim_create_autocmd("FileType", {
--        pattern = {"math", "latex"},
--        callback = function ()
--          vim.cmd([[Quickmath]])
--        end,
--      })
--    end,
--  },
}
-- fix bindings
-- refactor autocmds
-- get todo from notes
-- auto toc
-- fix folds
-- subscript and italics not working. Font issue?
-- get lsp working in looking-glass and get otter up and running
