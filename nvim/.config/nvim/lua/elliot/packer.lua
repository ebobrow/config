---@diagnostic disable: undefined-global
return require"packer".startup(function()
  use "wbthomason/packer.nvim"

  use "neovim/nvim-lspconfig"
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lsp", "onsails/lspkind-nvim",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      require "elliot.lsp"
      vim.opt.completeopt = "menu,menuone,preview"
      vim.opt.shortmess:append "c"

      local cmp = require("cmp")
      local lspkind = require "lspkind"
      lspkind.init()

      cmp.setup {
        snippet = {
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body)
            require('luasnip').lsp_expand(args.body)
          end
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_selected_entry() then
                cmp.confirm({
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = false
                })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true
            })
          }),
          ["<C-j>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<C-k>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<C-c>"] = cmp.mapping.abort()
        },
        window = { documentation = { border = "single" } },
        sources = {
          { name = "nvim_lsp" }, { name = "path" }, { name = "luasnip" }
        },
        experimental = { ghost_text = false, native_menu = false },
        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = { nvim_lsp = "[LSP]", path = "[path]", luasnip = "[snip]" }
          }
        }
      }
      cmp.setup.filetype({ "haskell" },
                         { completion = { autocomplete = false } })
      cmp.setup.filetype("tex", {
        sources = cmp.config
            .sources({ { name = "path" }, { name = "luasnip" } })
      })
    end
  }
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      require("luasnip.loaders.from_lua").lazy_load({
        paths = "~/.config/nvim/snippets/"
      })

      ls.config.set_config { enable_autosnippets = true }
    end
  }
  -- use {
  --   "hrsh7th/vim-vsnip",
  --   config = function() vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets" end
  -- }
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects", "p00f/nvim-ts-rainbow",
      "nvim-treesitter/nvim-treesitter-context"
    },
    run = ":TSUpdate",
    config = function()
      local parsers = require("nvim-treesitter.parsers")
      require"nvim-treesitter.configs".setup {
        ensure_installed = {
          "rust", "toml", "lua", "haskell", "latex", "python", "elixir"
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,

        -- List of parsers to ignore installing (or "all")
        ignore_install = { "all" },

        highlight = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-p>"
          }
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = { ["af"] = "@function.outer", ["if"] = "@function.inner" },
            include_surrounding_whitespace = true
          },
          swap = {
            enable = true,
            swap_next = { ["<leader>a"] = "@parameter.inner" },
            swap_previous = { ["<leader>A"] = "@parameter.inner" }
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = { [']m'] = '@function.outer' },
            goto_next_end = { [']M'] = '@function.outer' },
            goto_previous_start = { ['[m'] = '@function.outer' },
            goto_previous_end = { ['[M'] = '@function.outer' }
          }
        },
        rainbow = {
          enable = true,
          disable = vim.tbl_filter(function(p) return p ~= "racket" end,
                                   parsers.available_parsers())
        }
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
  use {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
    end
  }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup { flavour = "mocha", no_bold = true }
      vim.cmd.colorscheme "catppuccin"
      vim.cmd [[hi clear Todo]]
      vim.cmd [[hi link Todo Keyword]]
      vim.cmd [[hi MatchParen guibg=#45475a guifg=None]]
      -- vim.cmd [[hi NormalFloat guibg=black]]
    end
  }

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

  -- use {
  --   "isovector/cornelis",
  --   requires = { "kana/vim-textobj-user", "neovimhaskell/nvim-hs.vim" },
  --   run = "stack build",
  --   ft = "agda"
  -- }
  -- use {
  --   'lervag/vimtex',
  --   config = function() vim.g.vimtex_imaps_enabled = true end
  -- }
end)
