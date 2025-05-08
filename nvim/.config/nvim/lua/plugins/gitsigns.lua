return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
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
  }
}
