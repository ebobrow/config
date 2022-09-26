---@diagnostic disable: undefined-global
return require"packer".startup(function()
  use "wbthomason/packer.nvim"

  use "neovim/nvim-lspconfig"
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lsp", "onsails/lspkind-nvim"
    },
    config = function()
      require "elliot.lsp"
      vim.opt.completeopt = { "menu", "menuone", "noinsert" }
      vim.opt.shortmess:append "c"

      local cmp = require("cmp")
      local lspkind = require "lspkind"
      lspkind.init()

      cmp.setup {
        snippet = {
          expand = function(args) vim.fn["vsnip#anonymous"](args.body) end
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-j>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<C-k>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<C-c>"] = cmp.mapping.abort()
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
      vim.keymap.set("i", "<Tab>",
                     "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
                     { expr = true })
      vim.keymap.set("s", "<Tab>",
                     "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
                     { expr = true })
      vim.keymap.set("i", "<S-Tab>",
                     "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
                     { expr = true })
      vim.keymap.set("s", "<S-Tab>",
                     "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
                     { expr = true })
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

  -- use {
  --   'folke/tokyonight.nvim',
  --   config = function() vim.cmd [[colorscheme tokyonight-moon]] end
  -- }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
      require("catppuccin").setup()
      vim.cmd [[colorscheme catppuccin]]
    end
  }

  -- use {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require("onedark").setup {
  --       style = "darker",
  --       diagnostics = { background = false },
  --       highlights = { MatchParen = { bg = "none", fmt = "underline" } }
  --     }
  --     require("onedark").load()
  --   end
  -- }

  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          local function map_g(mode, l, r, opts)
            map(mode, "<leader>g" .. l, r, opts)
          end

          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map_g({ "n", "v" }, "s", gs.stage_hunk)
          map_g({ "n", "v" }, "r", gs.reset_hunk)
          map_g("n", "R", gs.reset_buffer)
          map_g("n", "p", gs.preview_hunk)
          map_g("n", "b", function() gs.blame_line { full = true } end)

          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end
      }
    end
  }
  use {
    "ThePrimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("harpoon").setup()
      for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, string.format(
                           ":lua require('harpoon.ui').nav_file(%s)<CR>", i),
                       { noremap = true, silent = true })
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
