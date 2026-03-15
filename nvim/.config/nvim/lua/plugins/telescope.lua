return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-ui-select.nvim"
    },
    keys = {
      {
        "<leader>f", function()
        if not pcall(require("telescope.builtin").git_files) then
          require("telescope.builtin").find_files { hidden = true }
        end
      end
      }, { "<leader>b", require("telescope.builtin").buffers }, {
      "<leader>rg", function()
      require("telescope.builtin").live_grep(
        require("telescope.themes").get_ivy {})
    end
    },
      { "<leader>xd", function() require("telescope.builtin").diagnostics() end },
      { "<leader>T",  function() require("telescope.builtin").builtin() end },
      {
        "<leader>ca",
        function() require("telescope.builtin").lsp_code_actions() end
      }
    },
    config = function()
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous
            },
            n = {
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous
            }
          },
          vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case', '-.', '-g', '!.git/**'
          },
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep
              .new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist
              .new
        },
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_cursor {} }
        }
      }
      require("telescope").load_extension("fzy_native")
      require("telescope").load_extension("ui-select")
    end
  }
}
