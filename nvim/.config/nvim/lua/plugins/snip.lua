return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { "~/.config/nvim/snippets/" }
      })

      ls.config.set_config { enable_autosnippets = true }
    end
  }
}

