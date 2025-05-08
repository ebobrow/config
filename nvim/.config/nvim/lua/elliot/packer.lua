---@diagnostic disable: undefined-global
return require"packer".startup(function()
  use "wbthomason/packer.nvim"

  use "neovim/nvim-lspconfig"
  use {
    "ray-x/lsp_signature.nvim",
    config = function() require"lsp_signature".setup { hint_enable = false } end
  }
  use {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
                     { desc = "Toggle Outline" })

      require("outline").setup { symbols = { icon_source = "lspkind" } }
    end
  }
  use "mrcjkb/rustaceanvim"
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
            c = cmp.mapping.abort()
          }),
          ["<C-j>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<C-k>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Select
          }
          -- ["<C-c>"] = cmp.mapping.abort()
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
        paths = { "~/.config/nvim/snippets/" }
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
      "nvim-treesitter/nvim-treesitter-textobjects", "p00f/nvim-ts-rainbow"
      -- "nvim-treesitter/nvim-treesitter-context"
    },
    run = ":TSUpdate",
    config = function()
      local parsers = require("nvim-treesitter.parsers")
      require"nvim-treesitter.configs".setup {
        ensure_installed = {
          "rust", "toml", "lua", "haskell", "latex", "python", "elixir"
        },
        modules = {},
        sync_install = true,
        auto_install = false,
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
  -- use "mkitt/tabline.vim"
  -- use {
  --   "mbbill/undotree",
  --   config = function()
  --     vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
  --   end
  -- }

  -- use {
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   config = function()
  --     require("catppuccin").setup { flavour = "mocha", no_bold = true }
  --     vim.cmd.colorscheme "catppuccin"
  --     vim.cmd [[hi clear Todo]]
  --     vim.cmd [[hi link Todo Keyword]]
  --     vim.cmd [[hi MatchParen guibg=#45475a guifg=None]]
  --     -- vim.cmd [[hi NormalFloat guibg=black]]
  --   end
  -- }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require"lualine".setup {
        sections = {
          lualine_a = { { 'mode', fmt = function(str)
            return str:sub(1, 1)
          end } }
        },
        options = { theme = "gruvbox-material" }
      }
    end
  }

  --   use {
  --     'shaunsingh/nord.nvim',
  --     config = function()
  --       vim.g.nord_disable_background = true
  --       vim.cmd.colorscheme "nord"

  --       vim.cmd [[hi TelescopeBorder guibg=#2e3440 guifg=#2e3440]]
  --       vim.cmd [[hi TelescopePromptBorder guibg=#2e3440 guifg=#2e3440]]
  --       vim.cmd [[hi TelescopeNormal guibg=#2e3440]]
  --       vim.cmd [[hi TelescopePreviewBorder guifg=#2e3440 guibg=#2e3440]]
  --       vim.cmd [[hi TelescopePreviewNormal guibg=#2e3440]]
  --       vim.cmd [[hi TelescopePreviewTitle guifg=#2e3440 guibg=#A3BE8C gui=bold]]
  --       vim.cmd [[hi TelescopeResultsBorder guifg=#2e3440 guibg=#2e3440]]
  --       vim.cmd [[hi TelescopeResultsNormal guibg=#2e3440]]
  --       vim.cmd [[hi TelescopePromptPrefix guifg=#5E81AC guibg=#2e3440]]
  --       vim.cmd [[hi TelescopePromptCounter guifg=#88C0D0 guibg=#2e3440]]
  --       vim.cmd [[hi TelescopePromptTitle guifg=#2e3440 guibg=t.blue gui=bold]]
  --       vim.cmd [[hi TelescopeResultsTitle guifg=#5E81AC guibg=#2e3440 gui=bold]]
  --     end
  --   }

  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup { underline = false, transparent_mode = true }
      vim.cmd.colorscheme "gruvbox"
      vim.cmd [[set background=dark]]

      vim.cmd [[hi clear LspReferenceText]]
      vim.cmd [[hi link LspReferenceText LspReferenceTarget]]
      vim.cmd [[hi clear LspReferenceRead]]
      vim.cmd [[hi link LspReferenceRead LspReferenceTarget]]
      vim.cmd [[hi clear LspReferenceWrite]]
      vim.cmd [[hi link LspReferenceWrite LspReferenceTarget]]

      vim.cmd [[hi NormalFloat guifg=#ebdbb2 guibg=#3c3836]]
    end
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = require "gitsigns"
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          local function map_g(mode, l, r, opts)
            map(mode, "<leader>g" .. l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })
            else
              gs.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gs.nav_hunk('prev')
            end
          end)

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

  use {
    "whonore/Coqtail",
    ft = "coq",
    config = function()
      vim.cmd [[hi link coqProofDelim Identifier]]
      vim.g["coqtail_imap_prefix"] = "<C-c>"
    end
  }
end)
