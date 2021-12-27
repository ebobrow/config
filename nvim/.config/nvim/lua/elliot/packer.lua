---@diagnostic disable: undefined-global
return require"packer".startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "tjdevries/astronauta.nvim"
  use "neovim/nvim-lspconfig"
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lsp", "onsails/lspkind-nvim"
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noinsert" }
      vim.opt.shortmess:append "c"

      vim.cmd [[highlight link CmpDocumentation Normal]]
      vim.cmd [[highlight link CmpDocumentationBorder Normal]]

      local cmp = require("cmp")
      local lspkind = require "lspkind"
      lspkind.init()

      cmp.setup {
        snippet = {
          expand = function(args) vim.fn["vsnip#anonymous"](args.body) end
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-l>"] = cmp.mapping.confirm({ select = true }),
          ["<C-j>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<C-k>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<C-h>"] = cmp.mapping.abort()
        },
        documentation = { border = "single" },
        sources = { { name = "nvim_lsp" }, { name = "path" } },
        experimental = { ghost_text = true, native_menu = false },
        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = { nvim_lsp = "[LSP]", path = "[path]" }
          }
        }
      }
    end
  }
  use {
    "hrsh7th/vim-vsnip",
    config = function()
      vim.api.nvim_set_keymap("i", "<Tab>",
                              "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
                              { expr = true })
      vim.api.nvim_set_keymap("s", "<Tab>",
                              "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
                              { expr = true })
      vim.api.nvim_set_keymap("i", "<S-Tab>",
                              "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
                              { expr = true })
      vim.api.nvim_set_keymap("s", "<S-Tab>",
                              "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
                              { expr = true })
    end
  }
  use {
    "tami5/lspsaga.nvim",
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
        tools = {
          hover_actions = { border = 'none' },
          inlay_hints = { highlight = "Comment" },
          autoSetHints = false
        },
        server = { on_attach = on_attach }
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

      vim.api.nvim_set_option("termguicolors", true)
      -- vim.cmd [[hi Float guibg=#282C34]]
      -- vim.cmd [[hi NormalFloat guibg=#282C34]]
      vim.cmd [[hi LspDiagnosticsVirtualTextError guibg=none]]
      vim.cmd [[hi LspDiagnosticsVirtualTextWarning guibg=none]]
      vim.cmd [[hi LspDiagnosticsVirtualTextInformation guibg=none]]
      vim.cmd [[hi LspDiagnosticsVirtualTextHint guibg=none]]
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
          ["n <leader>gb"] = '<cmd>Gitsigns blame_line<CR>',
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
  use "tpope/vim-surround"
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        signs = false,
        highlight = { keyword = "fg", after = "" }
      }
    end
  }
  use {
    "ThePrimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("harpoon").setup()
      vim.api.nvim_set_keymap("n", "<leader>1",
                              ":lua require('harpoon.ui').nav_file(1)<CR>",
                              { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>2",
                              ":lua require('harpoon.ui').nav_file(2)<CR>",
                              { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>3",
                              ":lua require('harpoon.ui').nav_file(3)<CR>",
                              { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>4",
                              ":lua require('harpoon.ui').nav_file(4)<CR>",
                              { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>m",
                              ":lua require('harpoon.mark').add_file()<CR>",
                              { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>t",
                              ":lua require('harpoon.term').gotoTerminal(1)<CR>",
                              { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>Q",
                              ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
                              { noremap = true })
    end
  }
end)
