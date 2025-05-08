return {
  { "tpope/vim-fugitive" }, { "tpope/vim-commentary" },
  { "tpope/vim-surround" }, { "tpope/vim-repeat" }, {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("harpoon"):setup() end,
    keys = {
      { "<leader>1", function() require("harpoon"):list():select(1) end },
      { "<leader>2", function() require("harpoon"):list():select(2) end },
      { "<leader>3", function() require("harpoon"):list():select(3) end },
      { "<leader>4", function() require("harpoon"):list():select(4) end },
      { "<leader>m", function() require("harpoon"):list():add() end }, {
        "<leader>Q", function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end
      }
    }
  }, {
    "whonore/Coqtail",
    ft = "coq",
    config = function()
      vim.cmd [[hi link coqProofDelim Identifier]]
      vim.g["coqtail_imap_prefix"] = "<C-c>"
    end
  }, {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } }
      },
      options = { theme = "gruvbox-material" }
    }
  }, {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = { "<leader>t" },
    opts = {
      open_mapping = "<leader>t",
      direction = "float",
      insert_mappings = false
    }
  }
}
