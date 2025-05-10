return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "davvid/harpoon-term.nvim" },
    config = function() require "harpoon":setup {} end,
    keys = {
      { "<leader>1", function() require("harpoon"):list():select(1) end },
      { "<leader>2", function() require("harpoon"):list():select(2) end },
      { "<leader>3", function() require("harpoon"):list():select(3) end },
      { "<leader>4", function() require("harpoon"):list():select(4) end },
      { "<leader>m", function() require("harpoon"):list():add() end }, {
      "<leader>Q", function()
      require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
    end
    }, { "<leader>t", function() require "harpoon_term".goto_terminal(1) end }
    }
  }
}
