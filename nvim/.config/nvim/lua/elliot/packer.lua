---@diagnostic disable: undefined-global
return require"packer".startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "neovim/nvim-lspconfig"
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lsp", "onsails/lspkind-nvim"
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noinsert" }
      vim.opt.shortmess:append "c"

      -- vim.cmd [[highlight link CmpDocumentation Normal]]
      -- vim.cmd [[highlight link CmpDocumentationBorder Normal]]

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
        window = { documentation = { border = "single" } },
        sources = { { name = "nvim_lsp" }, { name = "path" } },
        experimental = { ghost_text = true, native_menu = false },
        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = { nvim_lsp = "[LSP]", path = "[path]" }
          }
        }
      }
      cmp.setup.filetype({ "haskell", "lua" },
                         { completion = { autocomplete = false } })
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
        ensure_installed = { "rust", "toml", "lua", "haskell", "latex", "python" },
        highlight = { enable = true }
      }
    end
  }

  use "tpope/vim-fugitive"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  -- TODO: checkout vim-easyclip
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
      require "elliot.telescope"
      require "elliot.telescope.mappings"
    end
  }
  use "mkitt/tabline.vim"
  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
      vim.opt.background = "dark"
      vim.cmd [[colorscheme gruvbox]]

      vim.cmd [[ hi MatchParen gui=underline guibg=none ]]
      vim.cmd [[ hi LspReferenceText gui=none ]]
      vim.cmd [[ hi LspReferenceRead gui=none ]]
      vim.cmd [[ hi LspReferenceWrite gui=none ]]
    end
  }
  use { "rrethy/vim-hexokinase", run = "make hexokinase" }
  use {
    "mhinz/vim-signify",
    config = function()
      vim.keymap.set("n", "<leader>gp", ":SignifyHunkDiff<CR>",
                     { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>gr", ":SignifyHunkUndo<CR>",
                     { noremap = true, silent = true })
      vim.cmd [[let g:signify_sign_add = '│']]
      vim.cmd [[let g:signify_sign_delete = '_']]
      vim.cmd [[let g:signify_sign_delete_first_line = '‾']]
      vim.cmd [[let g:signify_sign_change = '│']]
      vim.cmd [[let g:signify_sign_change_delete = '~']]
    end
  }
  use { "AndrewRadev/splitjoin.vim", keys = { "gJ", "gS" } }
  use { "dstein64/vim-startuptime", cmd = "StartupTime" }
  use {
    "ThePrimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("harpoon").setup()
      for i = 1, 9 do
        vim.api.nvim_set_keymap("n", "<leader>" .. i, string.format(
                                    ":lua require('harpoon.ui').nav_file(%s)<CR>",
                                    i), { noremap = true, silent = true })
      end
      vim.keymap.set("n", "<leader>m", require("harpoon.mark").add_file,
                     { noremap = true })
      vim.keymap.set("n", "<leader>t",
                     function() require('harpoon.term').gotoTerminal(1) end,
                     { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>Q", require('harpoon.ui').toggle_quick_menu,
                     { noremap = true, silent = true })
    end
  }
end)
