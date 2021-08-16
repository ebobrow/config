---@diagnostic disable: undefined-global
return require"packer".startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "tjdevries/astronauta.nvim"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-compe"
  use {
    "glepnir/lspsaga.nvim",
    config = function()
      require"lspsaga".init_lsp_saga {
        use_saga_diagnostic_sign = false,
        code_action_prompt = {
          enable = false,
          sign = true,
          sign_priority = 20,
          virtual_text = false
        },
        finder_definition_icon = "  ",
        finder_reference_icon = "  ",
        max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
        finder_action_keys = {
          open = "o",
          vsplit = "s",
          split = "i",
          quit = "q",
          scroll_down = "<C-f>",
          scroll_up = "<C-b>" -- quit can be a table
        },
        code_action_keys = { quit = "q", exec = "<CR>" },
        rename_action_keys = {
          quit = "<C-c>",
          exec = "<CR>" -- quit can be a table
        },
        definition_preview_icon = "  ",
        border_style = "single",
        rename_prompt_prefix = ">"
      }
    end
  }
  use {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      local on_attach = require "elliot.lsp"
      require"rust-tools".setup {
        tools = { hover_actions = { border = 'none' } },
        server = {
          on_attach = function()
            on_attach()
            vim.keymap.nnoremap { "K", vim.lsp.buf.hover, buffer = 0 }
          end
        }
      }
    end
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require"nvim-treesitter.configs".setup {
        ensure_installed = {
          "rust", "toml", "html", "typescript", "tsx", "lua", "haskell"
        },
        highlight = { enable = true }
      }
    end
  }

  use "tpope/vim-fugitive"
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", "nvim-telescope/telescope-fzy-native.nvim"
    },
    config = function()
      require "elliot.telescope"
      require "elliot.telescope.mappings"
    end
  }
  use "mkitt/tabline.vim"
  use {
    "ii14/onedark.nvim",
    config = function()
      vim.cmd [[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]]
      vim.cmd [[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]]

      vim.cmd [[colorscheme onedark]]
      vim.api.nvim_set_option("background", "dark")

      vim.api.nvim_set_option("termguicolors", true)
    end
  }
  use "tpope/vim-commentary"
  use { "rrethy/vim-hexokinase", run = "make hexokinase" }
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup {
        keymaps = {
          ["n ]c"] = {
            expr = true,
            "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"
          },
          ["n [c"] = {
            expr = true,
            "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"
          },

          ["n <leader>gs"] = '<cmd>lua require "gitsigns".stage_hunk()<CR>',
          ["n <leader>gu"] = '<cmd>lua require "gitsigns".undo_stage_hunk()<CR>',
          ["n <leader>gr"] = '<cmd>lua require "gitsigns".reset_hunk()<CR>',
          ["n <leader>gR"] = '<cmd>lua require "gitsigns".reset_buffer()<CR>',
          ["n <leader>gp"] = '<cmd>lua require "gitsigns".preview_hunk()<CR>',
          ["n <leader>gb"] = '<cmd>lua require "gitsigns".blame_line(true)<CR>',
          ["n <leader>gS"] = '<cmd>lua require "gitsigns".stage_buffer()<CR>',
          ["n <leader>gU"] = '<cmd>lua require "gitsigns".reset_buffer_index()<CR>',

          -- Text objects
          ["o ig"] = ':<C-U>lua require "gitsigns.actions".select_hunk()<CR>',
          ["x ig"] = ':<C-U>lua require "gitsigns.actions".select_hunk()<CR>'
        }
      }
    end
  }
  use { "AndrewRadev/splitjoin.vim", keys = { "gJ", "gS" } }
  use { "dstein64/vim-startuptime", cmd = "StartupTime" }
  use {
    "mhinz/vim-startify",
    config = function()
      vim.g.startify_session_persistence = 1
      vim.g.startify_change_to_dir = 0
      vim.g.startify_enable_special = 0
      vim.g.startify_lists = {
        { type = "sessions", header = { "   Sessions" } },
        { type = "dir", header = { "   Recents (" .. vim.fn.getcwd() .. ")" } },
        { type = "files", header = { "   Recents" } }
      }
    end
  }
  use "tpope/vim-surround"
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      -- TODO: Configure this
      require("todo-comments").setup {
        signs = false,
        highlight = { keyword = "fg", after = "" }
      }
    end
  }
end)
