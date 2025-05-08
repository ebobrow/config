return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects", "p00f/nvim-ts-rainbow"
      -- "nvim-treesitter/nvim-treesitter-context"
    },
    build = ":TSUpdate",
    opts = {
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
        disable = vim.tbl_filter(function(p) return p ~= "racket" end, require(
                                     "nvim-treesitter.parsers").available_parsers())
      }
    }
  }
}
